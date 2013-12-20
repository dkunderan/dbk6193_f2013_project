# encoding: UTF-8
module SurveyorControllerCustomMethods
  def self.included(base)
    base.send :layout, 'surveyor_custom'
  end
end

class SurveyorController < ApplicationController
  include Surveyor::SurveyorControllerMethods
  include SurveyorControllerCustomMethods


  def surveyor_finish
    thanks_index_path
  end

  def create
      surveys = Survey.where(:access_code => params[:survey_code]).order("survey_version DESC")
      if params[:survey_version].blank?
        @survey = surveys.first
      else
        @survey = surveys.where(:survey_version => params[:survey_version]).first
      end
      
      ### Initialize a response set after first getting the facebook id of the user.
      #require_fb_graph_authentication
      authenticate_with_fb_graph
      #@response_set = ResponseSet.find_or_create_by_survey_id_and_user_id(@survey.id, 
      #                                                                   facebook_user.facebook_account_number)
      
      #added to insert multiple surveys
      @response_set = ResponseSet.create(:survey => @survey, :user_id => (@current_user.nil? ? @current_user : @current_user.id))
      @response_set.user_id = facebook_user.facebook_account_number
      

      facebook_response_set = FacebookResponseSet.find_or_create_by_response_set_id(@response_set.id)
      facebook_response_set.facebook_user_id = facebook_user.id
      session[:email_address]  = params[:user][:address]
      facebook_response_set.email_address = params[:user][:address]
      facebook_response_set.save


    
      save_relationships


      if (@survey && @response_set)
        flash[:notice] = t('surveyor.survey_started_success')
        redirect_to(surveyor.edit_my_survey_path(
          :survey_code => @survey.access_code, :response_set_code  => @response_set.access_code))
      else
        flash[:notice] = t('surveyor.Unable_to_find_that_survey')
        redirect_to surveyor_index
      end
    end
end

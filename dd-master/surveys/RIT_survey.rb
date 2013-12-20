# -*- coding: utf-8 -*-
survey "RIT quality of life survey", :default_mandatory => false do

 section "Basic questions" do
    question "How old are you?", :pick => :one, :display_type => :dropdown
    a "17 or younger"
    a "18"
    a "19"
    a "20"
    a "21"
    a "22"
    a "23"
    a "24"
    a "25 or older"

    question "How do you identify yourself? (Choose only one)", :pick => :one
    a "African American"
    a "White, not Hispanic"
    a "Hispanic, Latino/Latina"
    a "Asian or Pacific Islander"
    a "Middle Eastern descent"
    a "American Indian or Alaskan Native"
    a "Bi-racial/Multi-racial", :string
    a "Other", :string

    question "Work Status: (Choose only one)", :pick => :one
	a "Full-time (work 35 hours or more per week)"
	a "Part-time (work between 1-34 hours per week)"
	a "Not employed for pay"

    q_4 "Do you collect Social Security Disability Insurance (SSDI) or Supplemental Security Income (SSI)? (Choose only one)", :pick => :one
	a "SSDI"
	a "SSI"
	a "None of the above"

    q_5 "Current relationship status: (Choose only one)", :pick => :one
	a "Single (not in a romantic relationship)"
	a "In a relationship (but NOT living with boyfriend or girlfriend)"
	a "In a relationship and living with boyfriend or girlfriend"
	a "Married"
	a "Separated (How long? (MM/YY))", :string
 	a "Divorced (How long? (MM/YY)", :string
   	a "Widowed"

    q_6 "Are you a _______________?", :pick => :one
	a "U.S. student"
	a "International student"
      	a "Community member (not a student)"
 end
 section "Hearing Status and Language" do
    q_7 "Are you ___________? (Choose only one)", :pick => :one
	a_1 "Deaf"
	a_2 "Hard of Hearing"
	a_3 "Hearing"

    group do 
     dependency :rule => "A or B"
    condition_A :q_7, "==", :a_1
    condition_B :q_7, "==", :a_2

    q_8 "If deaf, how old were you when you became deaf? (Choose only one)", :pick => :one
 	a "Deaf from birth"
	a "After birth, age:", :integer
	a "I do not know"

    q_7b "Do you have Usher’s Syndrome?", :pick => :one
        a "Yes"
        a "No" 
    q_7c "Do you have Waardenburg Syndrome?", :pick => :one
        a "Yes"
        a "No" 

    q_7d "Do you have a cochlear implant (CI)?", :pick => :one
      a_3 "Yes"
        a_4 "No" 

    q_7d1 "At what age did you receive the CI?"
    dependency :rule => "C"
    condition_C :q_7d, "==", :a_3
        a_1 "Age", :integer

     q_7d2 "Do you still use the CI?"
    dependency :rule => "C"
    condition_C :q_7d, "==", :a_3
        a_1 "Yes"
        a_2 "No" 
   
   q_10 "Which languages do you use? (Check all that apply)", :pick => :one
	a "American Sign Language (ASL)"
	a "Signed English"
	a "Home Sign"
	a "Spoken English"
	a "Other:", :string

      q_11 "In which language are you most fluent? (Choose only one response)", :pick => :one
	a "American Sign Language (ASL)"
	a "Spoken English"
	a "Both ASL & English (bilingual)"
	a "Other:", :string

      q_12 "When did you start to learn ASL? (Choose only one)", :pick => :one
	a "Birth"
	a "After birth, age:", :integer
	a "Never learned ASL"

      q_13 "When did you start to learn Spoken English? (Choose only one)", :pick => :one
	a "Birth"
	a "After birth, age:", :integer
	a "Never learned Spoken English"

      q_14 "When did you start to learn written English?", :pick => :one
	a "Age:", :integer
    end
    q_14b "Is anyone in your family deaf?", :pick => :one
    a_1 "Yes"
    a_2 "No"

    group do
    dependency :rule => "E"
    condition_E :q_14b, "==", :a_1
      q_15 "Is your mother deaf?", :pick => :one
	a "Yes"
	a "No"


      q_16 "Is your father deaf?", :pick => :one
	a "Yes"
	a "No"
      q_17 "If you were not raised by your parents, were you raised with other guardians who were deaf?", :pick => :one
    	a_1 "Parents"
	a_2 "Another guardian"

    q_17a "Who?"
    dependency :rule => "A"
    condition_A :q_17, "==", :a_1
    a :string

    q_18 "Do you have deaf brothers/sisters?", :pick => :one
    	a_1 "Yes"
	a_2 "No"
   end
   repeater "Tell us about your deaf brothers. What are their ages?" do 
    dependency :rule => "A"
    condition_A :q_18, "==", :a_1
    q_18a1 "Age:"
      a :string
   end
   repeater "Tell us about your deaf sisters. What are their ages?" do 
    dependency :rule => "A"
    condition_A :q_18, "==", :a_1
    q_18b1 "Ages:"
      a :string
   end
    group do
    dependency :rule => "E"
    condition_E :q_14b, "==", :a_1
   q_19 "Do you have any other deaf relatives?", :pick => :one
    	a_1 "Yes"
	a_2 "No"
    q_19a "Who?"
    dependency :rule => "A"
    condition_A :q_19, "==", :a_1
    a :string

   end

   group "What language do you prefer to use for communication with..." do
     dependency :rule => "E"
    condition_E :q_14b, "==", :a_1
    q_20a "...your mother? (Choose only one)", :pick => :one
	a "ASL"
	a "Signed English"
	a "Home Sign"
	a "Spoken English"
	a "Other:", :string

    q_20b "...your father? (Choose only one)", :pick => :one
	a "ASL"
	a "Signed English"
	a "Home Sign"
	a "Spoken English"
	a "Other:", :string

    q_20c "...your brothers and sisters? (Choose only one)", :pick => :one
	a "ASL"
	a "Signed English"
	a "Home Sign"
	a "Spoken English"
	a "Other:", :string
       	a "N/A (I do not have any brothers or sisters)"

     q_21 "What language do you prefer to use for communication with your deaf friends? (Choose only 
      one)", :pick => :one
	a "ASL"
	a "Signed English"
	a "Spoken English"
	a "Other:", :string
         a "N/A (I do not have any deaf friends)"

      q_22 "What language do you prefer to use for communication with your hearing friends? (Choose 
       only one)", :pick => :one
	a "ASL"
	a "Signed English"
	a "Spoken English"
	a "Written English"
	a "Other:", :string
	a "N/A (I do not have any hearing friends)"

    end
    q_23 "What is your mother’s highest educational level? (Choose only one)", :pick => :one
        a "Elementary school"
	a "Middle School"
	a "Some High School"
	a "High School Graduate"
	a "GED"
	a "Some College"
	a "BA/BS Degree"
	a "Master’s Degree"
	a "Other Professional Graduate Degree (e.g., Ph.D., Ed.D., or M.D.)"
	a "I do not know"

     q_24 "What is your father’s highest educational level? (Choose only one)", :pick => :one
	a "Elementary school"
	a "Middle School"
	a "Some High School"
	a "High School Graduate"
	a "GED"
	a "Some College"
	a "BA/BS Degree"
	a "Master’s Degree"
	a "Other Professional Graduate Degree (e.g., Ph.D., Ed.D., or M.D.)"
	a "I do not know"
    end
    section "Sexual Health Information" do
      q_25 "Have you taken a NTID/RIT Freshmen Seminar class on health/sexuality education?", :pick => :one
	a "Yes"
	a "No"
      
      q_26 "When was the first time you had sex?", :pick => :any
	a "I have never had sex"
        a_v "Vaginal Age: ", :string
        a "Oral Age: ", :string
        a "Anal Age: ", :string
        a "Other: Age: ", :string

      group do 
         dependency :rule => "A"
         condition_A :q_26, "==", :a_v
         q_27 "When you had vaginal sex the first time did you use the following?", :pick => :any
				  a "Birth Control Pill" 
				  a "Depo Provera"
				  a "NuvaRing"
				  a "IUD"
				a "Condom"
				a "Dental Dam"
				a "Withdrawal"
				a "Other: ", :string
      end
      group do 
         dependency :rule => "A"
         condition_A :q_26, "==", :a_v
         q_28 "When you had anal sex the first time did you use the following?", :pick => :any
				  a "Birth Control Pill" 
				  a "Depo Provera"
				  a "NuvaRing"
				  a "IUD"
				a "Condom"
				a "Dental Dam"
				a "Withdrawal"
				a "Other: ", :string
      end

      group do 
         dependency :rule => "A"
         condition_A :q_26, "==", :a_v
         q_29 "When you had oral sex the first time did you use the following?",:pick => :any
				  a "Birth Control Pill" 
				  a "Depo Provera"
				  a "NuvaRing"
				  a "IUD"
				a "Condom"
				a "Dental Dam"
				a "Withdrawal"
				a "Other: ", :string
      end

      q_30 "During the past six months have you used condoms when having vaginal sex?",:pick => :any
        a "Always"
	a "Most of the time"
	a "Sometimes"
	a "Rarely"
	a "Never"

      q_31 "During the past six months have you used birth control pills when having vaginal sex?",:pick => :any
	a "Always"
	a "Most of the time"
	a "Sometimes"
	a "Rarely"
	a "Never"
      
      q_32   "During the past six months have you used condoms when having anal sex?",:pick => :any
	a "Always"
	a "Most of the time"
	a "Sometimes"
	a "Rarely"
	a "Never"

       q_33 "During the past six months have you used Dental Dam when having oral sex?",:pick => :any
	a "Always"
	a "Most of the time"
	a "Sometimes"
	a "Rarely"
	a "Never"

       q_34 "Do you use any of the following?",:pick => :any
				  a "Birth Control Pill" 
				  a "Depo Provera"
				  a "NuvaRing"
				  a "IUD"
				a "Condom"
				a "Dental Dam"
				a "Withdrawal"
				a "Other: ", :string
       q_35 "With how many different partners have you ever had vaginal intercourse?"
 	 a "# of Partners: ", :string

       q_36 "With how many different partners have you ever had oral intercourse?"
	a "# of Partners: ", :string

       q_37 "During the past year, with how many different partners have you have oral intercourse?"
	a "# of Partners: ", :string

       q_38 "With how many different partners have you ever had anal intercourse?"
	a "# of Partners: ", :string

       q_39 "During the past year, with how many different partners have you have anal intercourse?"
	 a "# of Partners: ", :string

       q_40 "For males only, have you impregnated women before?", :pick => :one
	a "No"
	a "Yes: How many times?" , :string
       
       q_41 "For females only, have you ever been pregant?", :pick => :one
	a "No"
	a_yes "Yes: How many times?" , :string
       
    group do
    dependency :rule => "E"
    condition_E :q_41, "==", :a_yes
      q_41a "How old were you the first time you became pregnant?"
         a "Age: ", :string

      q_41b "When your first pregnancy began, did you intend to get pregnant at that   
             time in your life?", :pick => :one
	 a "Yes"
	 a "No"
	 a "Didn’t Care"

      q_41c "Have you had an abortion?", :pick => :one
         a "No"
	 a "Yes: How many? ", :string

     end
      q_42 "Have you ever had a Sexually Transmitted Infection (STI) or Sexually Transmitted Disease   
      (STD)?", :pick => :one
	a "No"
	a_yes "Yes"

      group do
      dependency :rule => "E"
      condition_E :q_42, "==", :a_yes
        q_42a "How many times did you have an STI or STD?"
          a :string
        q_42b "When was the most recent time you had an STI or STD?"
          a "Year ", :string
          a "Month ", :string
      end

     q_43 "Have you ever been diagnosed with HIV/AIDS?", :pick => :one
	 a "No"
	 a "Yes"

     q_44 "Are you concerned that you are at risk for HIV/AIDS?", :pick => :one
	 a "No"
	 a "Yes"

     q_45 "Have you ever been diagnosed with Hepatitis C?", :pick => :one
	 a "No"
	 a "Yes"
   end
  section "Social Media Use" do
    grid "Which social networks do you check?" do
      a "Hourly"
      a "Daily"
      a "Weekly"
      a "Monthly"
      a "Every Several Months"
      a "Never"
      q "SMS (Cell phone text)"
      q "Twitter", :pick => :one
      q "Google+", :pick => :one
      q "MySpace", :pick => :one
      q "LinkedIn", :pick => :one
      q "Foursquare", :pick => :one
      q "Pinterest", :pick => :one
      q "Instagram", :pick => :one
      q "YouTube", :pick => :one
      q "AOL Instant Messenger", :pick => :one
      q "Other", :pick => :one
    end
    grid "Which social networks do you check?" do
      a "Hourly"
      a "Daily"
      a "Weekly"
      a "Monthly"
      a "Every Several Months"
      a "Never"
      q "Android",  :pick => :one
      q "IPhone", :pick => :one
      q "Blackberry", :pick => :one
      q "Apple Ipad", :pick => :one
      q "Apple Laptop", :pick => :one
      q "Windows Laptop", :pick => :one
      q "Linux Laptop", :pick => :one
      q "Apple Desktop", :pick => :one
      q "Windows Desktop", :pick => :one
      q "Linux Desktop", :pick => :one
      q "Other (please specify)", :pick => :one
     end
     grid "Please rate the following statements (1 = strongly disagree to 5 = strongly agree.)" do
     a "1"
     a "2"
     a "3"
     a "4"
     a "5"
     q "Facebook is part of my everyday activity", :pick => :one
     q "I am proud to tell people I'm on Facebook", :pick => :one
     q "Facebook has become part of my daily routine", :pick => :one
     q "I feel out of touch when I haven't logged onto Facebook for a while", :pick => :one 
     q "I feel I am part of the Facebook community", :pick => :one 
     q "I would be sorry if Facebook shut down", :pick => :one
     q "I have used Facebook to check out someone I met socially", :pick => :one
     q "I use Facebook to learn more about other people in my classes", :pick => :one
     q "I use Facebook to learn more about other people living near me", :pick => :one 
     q "I use Facebook to keep in touch with my old friends", :pick => :one
     q "I use Facebook to meet new people", :pick => :one
     q "I feel that I’m a person of worth, at least on an equal plane with others", :pick => :one
     q "I feel that I have a number of good qualities", :pick => :one
     q "All in all, I am inclined to feel that I am a failure (reversed)", :pick => :one 
     q "I am able to do things as well as most other people", :pick => :one
     q "I feel I do not have much to be proud of (reversed)", :pick => :one
     q "I take a positive attitude toward myself", :pick => :one
     q "On the whole, I am satisfied with myself", :pick => :one

     q "In most ways my life at NTID (RIT) is close to my ideal.", :pick => :one
     q "The conditions of my life at NTID (RIT) are excellent.", :pick => :one
     q "I am satisfied with my life at NTID (RIT).", :pick => :one
     q "So far I have gotten the important things I want at NTID (RIT).", :pick => :one
     q "If I could live my time at NTID (RIT) over, I would change almost nothing.", :pick => :one

     q "I feel I am part of the NTID (RIT) community I am interested in what goes on at NITD (RIT) NTID (RIT) is a good place to be", :pick => :one
     q "I would be willing to contribute money to NTID (RIT) after graduation", :pick => :one
     q "Interacting with people at NTID (RIT) makes me want to try new things", :pick => :one
     q "Interacting with people  at NTID (RIT) makes me feel like a part of a larger community", :pick => :one 
     q "I am willing to spend time to support general NTID (RIT) activities", :pick => :one 
     q "At NTID (RIT), I come into contact with new people all the time", :pick => :one
     q "Interacting with people at NTID (RIT) reminds me that everyone in the world is connected", :pick => :one

     q "There are several people at NTID (RIT) I trust to solve my problems", :pick => :one
     q "If I needed an emergency loan of $100, I know someone at NTID (RIT) I can turn to", :pick => :one
     q "There is someone at NTID (RIT) I can turn to for advice about making very important decisions", :pick => :one
     q "The people I interact with at NTID (RIT) would be good job references for me", :pick => :one
     q "I do not know people at NTID (RIT) well enough to get them to do anything important (reversed)", :pick => :one

     q "I’d be able to find out about events in another town from a high school acquaintance living there", :pick => :one
     q "If I needed to, I could ask a high school acquaintance to do a small favor for me", :pick => :one
     q "I’d be able to stay with a high school acquaintance if traveling to a different city", :pick => :one
     q "I would be able to find information about a job or internship from a high school acquaintance", :pick => :one
     q "It would be easy to find people to invite to my high school reunion", :pick => :one
    end
    end
end
    


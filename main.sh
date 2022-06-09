    read -p "Enter target email:>" email
    echo -e -n " [\e[1;31m*\e[0m] Gathering informations..."
    jsondata=$(curl --silent emailrep.io/$email)
    #jsondata=$(cat brutjson.json)

    echo -e "\e[0;32m [OK]\e[0m"

    echo -e -n " [\e[1;31m*\e[0m] Parsing informations..."
    email_reputation=$(echo $jsondata | jq .reputation)
    email_suspicious=$(echo $jsondata | jq .suspicious)
    email_reputation=$(echo $jsondata | jq .reputation)
    email_reputationscore=$(echo $jsondata | jq .references)
    email_blacklisted=$(echo $jsondata | jq .details.blacklisted)
    email_maliciousactivity=$(echo $jsondata | jq .details.malicious_activity)
    email_recentmalicious=$(echo $jsondata | jq .details.malicious_activity_recent)
    email_credsleak=$(echo $jsondata | jq .details.credentials_leaked)
    email_databreach=$(echo $jsondata | jq .details.data_breach)
    email_firstseen=$(echo $jsondata | jq .details.first_seen)
    email_lastseen=$(echo $jsondata | jq .details.last_seen)
    email_domainexists=$(echo $jsondata | jq .details.domain_exists)
    email_domainreputation=$(echo $jsondata | jq .details.domain_reputation)
    email_newdomain=$(echo $jsondata | jq .details.new_domain)
    email_dayssincedomaincreation=$(echo $jsondata | jq .details.days_since_domain_creation)
    email_suspicioustld=$(echo $jsondata | jq .details.suspicious_tld)
    email_spam=$(echo $jsondata | jq .details.spam)
    email_freeprovider=$(echo $jsondata | jq .details.free_provider)
    email_disposable=$(echo $jsondata | jq .details.disposable)
    email_deliverable=$(echo $jsondata | jq .details.deliverable)
    email_acceptall=$(echo $jsondata | jq .details.accept_all)
    email_validmx=$(echo $jsondata | jq .details.valid_mx)
    email_primarymx=$(echo $jsondata | jq .details.primary_mx)
    email_spoofable=$(echo $jsondata | jq .details.spoofable)
    email_spf_strict=$(echo $jsondata | jq .details.spf_strict)
    email_DMARC=$(echo $jsondata | jq .details.dmarc_enforced)
    email_profiles=$(echo $jsondata | jq .details.profiles)


function booleancolor() {
  if [[ $1 == false ]]; then
    #green
    echo -e "\e[0;32m No\e[0m"
  elif [[ $1 == true ]]; then
    #red
    echo -e "\e[1;31m Yes\e[0m"
  else
    echo "$1"
  fi
}

function reversedbooleancolor() {
  if [[ $1 == true ]]; then
    #green
    echo -e "\e[0;32m Yes\e[0m"
  elif [[ $1 == false ]]; then
    #red
    echo -e "\e[1;31m No\e[0m"
  else
    echo " $1"
  fi
}

echo -e "\e[0;32m [OK]\e[0m"


     echo -e "\e[1;31m \n_____FULL REPORT_____\e[1;31m \e[0m\n"
     echo -e "-Email: |"
     booleancolor $email
     echo -n "-Suspicious: |"
     booleancolor $email_suspicious
     echo -n "-Has reputation: |"
     booleancolor $email_reputation
     echo -n "-Reputation score: "
     booleancolor $email_reputationscore
     echo -n "-Is blacklisted: |"
     booleancolor $email_blacklisted
     echo -n "-Has a malicious activity: |"
     booleancolor $email_maliciousactivity
     echo -n "-Has a recent malicious activity: |"
     booleancolor $email_recentmalicious
     echo -n "-Creditentials leaked: |"
     booleancolor $email_credsleak
     echo -n "-Is on a data breach: |"
     booleancolor $email_databreach
     echo -n "-First seen: |"
     booleancolor $email_firstseen
     echo -n "-Last seen: |"
     booleancolor $email_lastseen
     echo -n "-Domain exists: |"
     reversedbooleancolor $email_domainexists
     echo -n "-Domain reputation: |"
     booleancolor $email_domainreputation
     echo -n "-Is a new domain: |"
     booleancolor $email_newdomain
     echo -n "-Days since domain creation: |"
     booleancolor $email_dayssincedomaincreation
     echo -n "-Suspicious extention: |"
     booleancolor $email_suspicioustld
     echo -n "-Is spam: |"
     booleancolor $email_spam
     echo -n "-Free provider: |"
     booleancolor $email_freeprovider
     echo -n "-Temporary address: |"
     booleancolor $email_disposable
     echo -n "-Deliverable: |"
     reversedbooleancolor $email_deliverable
     echo -n "-Accept all: |"
     booleancolor $email_acceptall
     echo -n "-Valid MX: |"
     reversedbooleancolor $email_validmx
     echo -n "-Primary Mail Exchanger: |"
     booleancolor $email_primarymx
     echo -n "-Spoofable: |"
     booleancolor $email_spoofable
     echo -n "-Strict SPF: |"
     reversedbooleancolor $email_spf_strict
     echo -n "-DMARC (Domain-based Message Authentication, Reporting & Conformance) enforced: |"
     reversedbooleancolor $email_DMARC
     echo -n "-Profiles on social medias: |"
     booleancolor $email_profiles

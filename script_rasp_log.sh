#!/bin/bash

#getopts is used to read any arguments the user wrote in the shell 
function print_pi_status(){
	str_clock_cmd='echo "$(($(vcgencmd measure_clock arm | cut -d "=" -f 2)/1000/1000))Mhz"';
	str_clock=$(eval ${str_clock_cmd});
	str_throttle_history=$(eval vcgencmd get_throttled);
	str_temp=$(eval vcgencmd measure_temp);
	str_volt=$(eval vcgencmd measure_volts);
	final_str="$(date);${str_throttle_history};${str_clock};${str_temp};${str_volt}"; 
	echo $final_str;
}

#export sets env variables, export -f exports a function to other scripts called
#by this script. In this case the other script called by this one would be
#watch function (?)
export -f print_pi_status; 

#create array called "argument" to navigate through them easier

#read first program argument if any
getopts f:n: name;
declare -A argument1=(
    [type]=${name}
    [value]=${OPTARG}
);

#read second program argument if any
getopts f:n: name;
declare -A argument2=(
    [type]=${name}
    [value]=${OPTARG}
);
declare -n argument;

cmdarg_file="";
cmdarg_interval="";

#prepare "watch command arguments" if user uses any
for argument in ${!argument@}; do		
	if [[ ${argument[type]} = "f" && ! -z ${argument[value]} ]]; then
		cmdarg_file="| tee -a ${argument[value]}";
	elif [[ ${argument[type]} = "n" && ! -z ${argument[value]} ]]; then
		cmdarg_interval="-n ${argument[value]}";
	fi
done

#execute watch command
watch ${cmdarg_interval} -x bash -c "print_pi_status ${cmdarg_file}";

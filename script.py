from clyngor import ASP, solve
import numpy as np
import time


def print_stats_and_results(answers_list, answers, time):
    if (len(answers_list) != 0):
        for  answer in answers_list:
            print(answer)
        nb_model_announced = answers.statistics['Models']
        print(nb_model_announced, ' model/models')
        print(time, 'seconds')
    else:
        print('No results could be found!')

#Scheduling/sample04.txt','Scheduling/config04.txt'
sample = input("Which sample file do you want to use:")
config = input("Which config file do you want to use:")
init = time.perf_counter()
answers = solve(['parte2.lp', sample,config], time_limit=200, stats = True, nb_model=None)
duration = time.perf_counter() - init
answers_list = list(answers)

if(len(answers_list) == 0):
    print("No results could be found for group 2")
    init = time.perf_counter()
    answers = solve(['parte1.lp',sample,config], time_limit=200, stats=True, nb_model=None)
    answers_list = list(answers)
    duration = time.perf_counter() - init

print_stats_and_results(answers_list, answers, duration)

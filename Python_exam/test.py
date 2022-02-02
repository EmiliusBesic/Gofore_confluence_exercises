import statistics
import argparse

def add_arguments():
    parser = argparse.ArgumentParser()
    parser.add_argument("file_name", help="file name")
    parser.add_argument("operation", choices=['sum', 'avg', 'median'],help="sum, avg or median")
    parser.add_argument("--comp",nargs=2,help="gt, lt or eq and value to compare to")
    args = parser.parse_args()
    a_file = args.file_name
    operation = args.operation
    first_comp = args.comp[0]
    second_comp = args.comp[1]

    return a_file, operation, first_comp, second_comp


def get_file_contents(a_file):
    with open(a_file) as f:
        file_contents = f.read()
        numbers = file_contents.split()
        numbers = [int(x.rstrip()) for x in numbers]

    return numbers


def calculate_and_print_results(operation, numbers):
    if operation == 'sum':
        op_result = sum(numbers)
        op_result = str(op_result)
        print(f'Summa on:  {op_result}')
    elif operation == 'avg':
        op_result = statistics.mean(numbers)
        op_result = str(op_result)
        print(f'Keskiarvo on:  {op_result}')
    elif operation == 'median':
        op_result = statistics.median(numbers)
        op_result = str(op_result)
        print(f'Mediaani on:  {op_result}')

    return op_result


def compare(first_comp, second_comp):
    if first_comp == 'gt':
        int(second_comp)
        if result > second_comp:
            print(result+' On suurempi kuin '+second_comp)
        else:
            print(result+' ei ole suurempi kuin '+second_comp)
    elif first_comp == 'lt':
        int(second_comp)
        if result < second_comp:
            print(result+' On pienempi kuin '+second_comp)
        else:
            print(result+' ei ole pienempi kuin '+second_comp)
    elif first_comp == 'eq':
        int(second_comp[1])
        if result == second_comp:
            print(result+' On yhtäsuuri kuin '+second_comp)
        else:
            print(result+' ei ole yhtäsuuri kuin '+second_comp)
    else:
        raise ValueError('give arguments:gt,lt or eq')


if __name__ == "__main__":

    a_file, operation, first_comp, second_comp = add_arguments()
    numbers = get_file_contents(a_file)
    result = calculate_and_print_results(operation,numbers)
    compare(first_comp, second_comp)
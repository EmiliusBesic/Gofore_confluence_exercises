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
    comp = 'no'
    comp_value = 'no'
    if args.comp != None:
        comp = args.comp[0]
        comp_value = args.comp[1]

    return a_file, operation, comp, comp_value


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


def compare(comp, comp_value):
    if comp != 'no':
        if comp == 'gt':
            int(comp_value)
            if result > comp_value:
                print(f'{result} on suurempi kuin {comp_value}')
            else:
                print(f'{result} ei ole suurempi kuin {comp_value}')
        elif comp == 'lt':
            int(comp_value)
            if result < comp_value:
                print(f'{result} on pienempi kuin {comp_value}')
            else:
                print(f'{result} ei ole pienempi kuin {comp_value}')
        elif comp == 'eq':
            int(comp_value)
            if result == comp_value:
                print(f'{result} on yhtäsuuri kuin {comp_value}')
            else:
                print(f'{result} ei ole yhtäsuuri kuin {comp_value}')
        else:
            raise ValueError('give arguments:gt,lt or eq')


if __name__ == "__main__":

    a_file, operation, comp, comp_value = add_arguments()
    numbers = get_file_contents(a_file)
    result = calculate_and_print_results(operation,numbers)
    compare(comp, comp_value)
import statistics
import argparse





if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("file_name", help="file name")
    parser.add_argument("operation", choices=['sum', 'avg', 'median'],help="sum, avg or median")

    parser.add_argument("--comp",nargs=2,help="gt, lt or eq and value to compare to")


    args = parser.parse_args()

    a_file = open(args.file_name)
    file_contents = a_file.read()
    numbers = file_contents.split()
    for i in range(0, len(numbers)):
        numbers[i] = int(numbers[i])


    if args.operation == 'sum':
        op_result = sum(numbers)
        op_result = str(op_result)
        print("Summa on: "+ op_result)
    elif args.operation == 'avg':
        op_result = statistics.mean(numbers)
        op_result = str(op_result)
        print("Keskiarvo on: "+ op_result)
    elif args.operation == 'median':
        op_result = statistics.median(numbers)
        op_result = str(op_result)
        print("Mediaani on: "+ op_result)

    if args.comp[0] == 'gt':
        if op_result > args.comp[1] :
           print(op_result+' On suurempi kuin '+args.comp[1])
        else:
            print(op_result+' ei ole suurempi kuin '+args.comp[1])
    elif args.comp[0] == 'lt':
        if op_result < args.comp[1] :
           print(op_result+' On pienempi kuin '+args.comp[1])
        else:
            print(op_result+' ei ole pienempi kuin '+args.comp[1])
    elif args.comp[0] == 'eq':
        if op_result == args.comp[1] :
           print(op_result+' On yhtäsuuri kuin '+args.comp[1])
        else:
            print(op_result+' ei ole yhtäsuuri kuin '+args.comp[1])

         

    



    

   
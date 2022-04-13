(*1*)
fun is_older (date1: int*int*int, date2: int*int*int): bool = 
    if #1 date1 < #1 date2 then 
        true 
    else 
        if #1 date1 > #1 date2 then 
            false
        else 
            if #2 date1 < #2 date2 then 
                true
            else 
                if #2 date1 > #2 date2 then 
                    false
                else 
                    if #3 date1 < #3 date2 then 
                        true
                    else false;             
            

fun is_older_test() =
  if is_older((2020, 6, 20), (2021, 6, 23)) <> true
  then raise Fail "Test of is_older passed failed at 1 case."
  else

  if is_older((2020, 5, 1), (2020, 2, 1)) <> false
  then raise Fail "Test of is_older passed failed at 2 case."
  else

  if is_older((2020, 5, 1), (2020, 5, 3)) <> true
  then raise Fail "Test of is_older passed failed at 3 case."
  else
  
  if is_older((2020, 5, 1), (2020, 5, 1)) <> false
  then raise Fail "Test of is_older passed failed at 4 case."
  else

  print("Test of is_older passed.");

is_older_test();


(*2*)
fun number_in_month (dates: (int*int*int) list, month: int): int = 
    if null dates then 0
    else 
        if #2 (hd dates) = month then
            number_in_month (tl dates, month) + 1
        else 
            number_in_month (tl dates, month);


fun number_in_month_test() =
  if number_in_month([(2020, 4, 20), (2020, 5, 23), (2020, 5, 23), (2020, 3, 23), (2020, 5, 23)], 5) <> 3
  then raise Fail "Test of number_in_month passed failed at 1 case."
  else

  print("Test of number_in_month passed.");

number_in_month_test();

(*3*)
fun date_in_months (date: int*int*int, months: int list): bool = 
    if null months then false
    else 
        if #2 date = hd months then
            true
        else 
            date_in_months(date, tl months);

fun number_in_months (dates: (int*int*int) list, months: int list): int = 
    if null dates then 0
    else 
        if date_in_months((hd dates), months) then
            number_in_months (tl dates, months) + 1
        else 
            number_in_months (tl dates, months);


fun number_in_months_test() =
  if number_in_months([(2020, 4, 20), (2020, 5, 23), (2020, 5, 23), (2020, 3, 23), (2020, 3, 23)], [5, 3]) <> 4
  then raise Fail "Test of number_in_months passed failed at 1 case."
  else

  print("Test of number_in_months passed.");

number_in_months_test();

(*4*)
fun dates_in_month (dates: (int*int*int) list, month: int): (int*int*int) list = 
    if null dates then []
    else 
        if #2 (hd dates) = month then
            hd dates :: dates_in_month(tl dates, month)
        else 
            dates_in_month(tl dates, month);


fun dates_in_month_test() =
  if dates_in_month([(2020, 4, 20), (2020, 5, 21), (2020, 5, 22), (2020, 3, 23), (2020, 5, 24)], 5) <> [(2020,5,21),(2020,5,22),(2020,5,24)]
  then raise Fail "Test of dates_in_month passed failed at 1 case."
  else

  print("Test of dates_in_month passed.");

dates_in_month_test();

(*5*)
fun dates_in_months (dates: (int*int*int) list, months: int list): (int*int*int) list = 
    if null dates then []
    else 
        if date_in_months((hd dates), months) then
            hd dates :: dates_in_months(tl dates, months)
        else 
            dates_in_months(tl dates, months);


fun dates_in_months_test() =
  if dates_in_months([(2020, 4, 20), (2020, 5, 21), (2020, 5, 22), (2020, 3, 23), (2020, 5, 24)], [5, 3]) <> [(2020,5,21),(2020,5,22),(2020,3,23),(2020,5,24)]
  then raise Fail "Test of dates_in_months passed failed at 1 case."
  else

  print("Test of dates_in_months passed.");

dates_in_months_test();

(*6*)
fun get_nth(strings: string list, n: int) : string = 
    if null strings then
        ""
    else
        if n - 1 = 0 then
            hd strings
        else 
            get_nth(tl strings, n - 1);


fun get_nth_test() =
  if get_nth(["qqqqq", "wwwwwwww", "eeeeeee", "rrrrrrrr", "tttttttt"], 3) <> "eeeeeee"
  then raise Fail "Test of get_nth passed failed at 1 case."
  else

  print("Test of get_nth passed.");

get_nth_test();


(*7*)
fun date_to_string(date: int*int*int): string = 
    let val months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    in
        get_nth(months, #2 date) ^ " " ^ Int.toString(#3 date) ^ ", " ^ Int.toString(#1 date)
    end;

date_to_string((2022, 4, 6));

fun date_to_string_test() =
  if date_to_string((2022, 4, 6)) <> "April 6, 2022"
  then raise Fail "Test of date_to_string passed failed at 1 case."
  else

  print("Test of date_to_string passed.");

date_to_string_test();

(*8*)
fun number_before_reaching_sum (sum: int, ints: int list): int = 
    if sum <= 0 then
        ~1
    else
        number_before_reaching_sum(sum - (hd ints), tl ints) + 1;


fun number_before_reaching_sum_test() =
  if number_before_reaching_sum(43, [30, 30, 30, 30, 30, 30, 30]) <> 1
  then raise Fail "Test of number_before_reaching_sum passed failed at 1 case."
  else

  if number_before_reaching_sum(96, [30, 30, 30, 30, 30, 30, 30]) <> 3
  then raise Fail "Test of number_before_reaching_sum passed failed at 2 case."
  else

  print("Test of number_before_reaching_sum passed.");

number_before_reaching_sum_test();

(*9*)
fun what_month (day: int): int = 
    let val months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    in
        number_before_reaching_sum(day, months) + 1
    end;


fun what_month_test() =
  if what_month(256) <> 9
  then raise Fail "Test of what_month passed failed at 1 case."
  else

  print("Test of what_month passed.");

what_month_test();

(*10*)
fun range(a: int, b: int): int list = 
    if a <= b + 1 then
        a :: range(a + 1, b)
    else
        []

fun month_range(day1: int, day2: int): int list = 
    if day1 > day2 then
        []
    else
        range(what_month(day1), what_month(day2));


fun month_range_test() =
  if month_range(45, 256) <> [2,3,4,5,6,7,8,9,10]
  then raise Fail "Test of month_range passed failed at 1 case."
  else

  print("Test of month_range passed.");

month_range_test();

(*11*)
fun oldest (dates: (int*int*int) list) = 
    if null dates then
        NONE
    else
        let fun get_oldest(dates: (int*int*int) list) =
            if null (tl dates) then
                hd dates
            else
                let val tl_ans = get_oldest(tl dates)
                in
                    if is_older(hd dates, tl_ans) then
                        hd dates
                    else
                        tl_ans
                end

        in
            SOME (get_oldest(dates))
        end;


fun oldest_test() =
  if oldest([(2000, 4, 20), (2020, 5, 21), (2020, 5, 22), (1999, 3, 23), (2020, 5, 24)]) <> SOME (1999,3,23)
  then raise Fail "Test of oldest passed failed at 1 case."
  else

  print("Test of oldest passed.");

oldest_test();
-module(gigasecond).

-export([from/1]).

from(From) -> 
    case calendar:valid_date(From) of
        true -> count_date(From);
        _ -> count_datetime(From)
    end.

count_date(From) ->
    GregorianDays = calendar:date_to_gregorian_days(From),
    DateInSec = calendar:datetime_to_gregorian_seconds(GregorianDate),
    NewDateInSec = DateInSec + 1000000000,
    calendar:gregorian_seconds_to_datetime(NewDateInSec).

count_datetime(From) ->
    DateInSec = calendar:datetime_to_gregorian_seconds(From),
    NewDateInSec = DateInSec + 1000000000,
    calendar:gregorian_seconds_to_datetime(NewDateInSec).
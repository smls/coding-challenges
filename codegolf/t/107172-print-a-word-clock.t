#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-in  => *.comb(/\d+/)».Int.Capture,
    thaw-out => *.subst('|', '', :g),
;


# |IT IS HALF TEN|
# |QUARTER TWENTY|
# |FIVE MINUTES TO|
# |PAST TWO THREE|
# |ONE FOUR FIVE|
# |SIX SEVEN EIGHT|
# |NINE TEN ELEVEN|
# |TWELVE O'CLOCK|

=finish
17:23

|IT IS         |
|        TWENTY|
|FIVE MINUTES   |
|PAST          |
|         FIVE|
|               |
|               |
|              |

19:20

|IT IS         |
|        TWENTY|
|     MINUTES   |
|PAST          |
|             |
|    SEVEN      |
|               |
|              |

13:15

|IT IS         |
|QUARTER       |
|               |
|PAST          |
|ONE          |
|               |
|               |
|              |

13:58

|IT IS         |
|              |
|               |
|     TWO      |
|             |
|               |
|               |
|       O'CLOCK|

14:30

|IT IS HALF    |
|              |
|               |
|PAST TWO      |
|             |
|               |
|               |
|              |

15:35

|IT IS         |
|        TWENTY|
|FIVE MINUTES TO|
|              |
|    FOUR     |
|               |
|               |
|              |

10:00

|IT IS         |
|              |
|               |
|              |
|             |
|               |
|     TEN       |
|       O'CLOCK|

Input: 12:00

|IT IS         |
|              |
|               |
|              |
|             |
|               |
|               |
|TWELVE O'CLOCK|

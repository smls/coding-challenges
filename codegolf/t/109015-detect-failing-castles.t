#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-out => {?/True/},
;

=finish
#  #
####
####

False

#
 ###      ####
#### #  # ####
##############
######  ######
#####    #####
``````````````

False

```

False

      # # #    # # #   
      ##############
      ##### ## #####
    # #### #  # #### #  
  ###  ##  ####  ##  ###
  ### #  # #### #  # ###
  ######################
  #####  ########  #####
  ####    ######    ####
  ####    ######    ####
``````````````````````````

False

   

False

# #
#
```````

False

   
```

False

#
`

True

#  #      #  #
####      ####
#### #  # ####
##############
######  ######
#####    #####
``````````````

True

                      ####  ###
                      #  #### ####
                      #         ####
    #  #      #  #   ##           ####
    ####      ####   # #             #
    #### #  # ####   ###
    ##############   ###
    ######  ######   ###
    #####    #####   ###
    #####    #####   ###
`````````````````````````````````````````

True

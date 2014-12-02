# Waiable

waiable gem is the Rails **W**&#8203;eb **A**&#8203;ccessibility **I**&#8203;nitiative for differently **able**.

This gem forces all Rails ActionView components to be compliant with WAI-ARIA standards.
It either overrides the existing ActionView components and also aims to add more widgets which are already accessibility compliant. 
Although we started with the accessibility widgets early on, we have now shifted our focus to 
first override the basic stuff like forms and web content (images/tables/page structure) that gets generated out of Rails core.
If you are looking to contribute, please  go through the contributing section below.


## Installation

Add this line to your application's Gemfile:

    gem 'waiable'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install waiable

## Usage


## Contributing
###Contributing via Meetup events
Starting December 2014, we are taking up contributions to WAIable as part of PRUG Meetups. So we would recommend to have an account on Meetup and be part of Pune Ruby Users Group.
###Follow us
Twitter: @techvision_ss
Blog: http://accessiblerails.wordpress.com

###How to go about it?
1. Fork it 
https://github.com/techvision/waiable/fork
2. Create your feature branch ( git checkout -b my-new-feature )
3. Commit your changes ( git commit -am 'Add some feature' )
4. Push to the branch ( git push origin my-new-feature )
5. Create new Pull Request
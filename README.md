# WAIAble

WAIAble gem is the Rails **W**&#8203;eb **A**&#8203;ccessibility **I**&#8203;nitiative for differently **able**.

WAIAble gem will add accessibility features in rails form and will make rails form  fully accessible to 
screen reader users and keyboard users. This gem forces all the form fields to be compliant with WAI-ARIA standards.
If you are looking to contribute, please  go through the contributing section below.

## Installation

Add it to your Gemfile:

```ruby
gem 'waiable'
```

Run the following command to install it:

```console
bundle install
```

## Usage

WAIAble gem will add different accessibility features to make rails form accessible for screen reader users and keyboard users. Visually this will not remove or change any existing functionalities provided by rails core and will include aria-properties for form fields to enhance screen reader performance. To make form labels accessible, aria-labelledby property is added and default id attribute gets generated for label_for element. For mandatory form fields, aria-required property gets added when presence validator is added for that form field. For text field and text area, when maxlength option is provided, aria-describedby property is added to that form field which will announce about the size limitation of that field to the screen reader. On form submission, if there is any error then these error messages are linkable and clicking on that linkwill shift the focus  to the form field for which the error gets generated. Additionally the error message id will be added to the aria-describedby property which will announce the error message to the screen reader when the focus is on errorneous input field. For search field, aria-label property is added to provide information about the search field to the screen reader.

## Bug Reports

If you discover any bugs, feel free to create an issue on github. Please provide sufficient information so that we can fix the possible bug.

https://github.com/techvision/waiable/issues

## Maintainers

* Sanghapal Bhowate sangha@techvision.net.in
* Shantanu Choudhury shantanu@techvision.net.in


## Contributing
###Fork the repository
1. Fork it 
https://github.com/techvision/waiable/fork
2. Create your feature branch ( git checkout -b my-new-feature )
###Contribute at Pune Ruby Meetups

Starting December 2014, we are taking up contributions to WAIable as part of PRUG Meetups. So we would recommend to have an account on [Meetup](http://www.meetup.com/) and be part of [Pune Ruby Users Group](http://www.meetup.com/PuneRailsMeetup/).
Meetup events are being posted out there and we call upon contributions from vibrant Ruby community for WAIable.
You can join  us in the meetup to have more insight into what Accessibility is all about and what we are doing in WAIable.
###Then contribute online
1. Commit your changes ( git commit -am 'Add some feature' )
2. Push to the branch ( git push origin my-new-feature )
3. Create new Pull Request
###Follow us
Twitter: @techvision_ss
Blog: http://accessiblerails.wordpress.com

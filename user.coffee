@Schema ?= {}

Schema.address = new SimpleSchema
  street:
    type: String
    max: 100
    optional: true
  city:
    type: String
    max: 50
    optional: true
  state:
    type: String
    optional: true
  apartmentNumber:
    type: String
    optional: true
  zipCode:
    type: String
    regEx: /^[0-9]{5}$/
    optional: true
  country:
    type: String
    optional: true

Schema.userProfile = new SimpleSchema
  firstName:
    type: String
    min: 2
    max: 25
    optional: true
  lastName:
    type: String
    min: 2
    max: 25
    optional: true
  couponCode:
    type: String
    optional: true
  name:
    type: String
    optional: true
  address1:
    type: Schema.address
    optional: true
  address2:
    type: Schema.address
    optional: true
  phone:
    label: 'Phone number'
    type: String
    regEx: /[0-9 ]*/
    optional: true
  terms:
    type: Boolean
    optional: true
  image:
    type: String
    optional: true
  upgraded:
    type: Date
    optional: true
  billing:
    blackbox: true
    optional: true
    type: Object

Schema.userEmail = new SimpleSchema
  address:
    label: 'Email'
    regEx: /[a-z0-9!#$%&'*+\/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+\/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/i
    type: String
  verified:
    type: Boolean
    optional: true
  invalid:
    type: Boolean
    optional: true

Schema.referral = new SimpleSchema
  recipient:
    type: String
  sentAt:
    type: Date
    optional: true
  completedAt:
    type: Date
    optional: true

Schema.reward = new SimpleSchema
  recipient:
    type: String
  sentAt:
    type: Date
    optional: true
  completedAt:
    type: Date
    optional: true

Schema.user = new SimpleSchema
  _id:
    type: String
    optional: true
  coins:
    type: Number
    defaultValue: 0
  cards:
    defaultValue: []
    type: [Object]
    blackbox: true
  stripeCharges:
    type: [String]
    optional: true
  stripeProcessing:
    type: Date
    optional: true
  subscriptionId:
    type: String
    optional: true
  stripeId:
    type: String
    optional: true
  emails:
    type: [Schema.userEmail]
    optional: true
  createdAt:
    type: Date
  renewedAt:
    type: Date
    optional: true
  profile:
    optional: true
    type: Schema.userProfile
  roles:
    type: [String]
    optional: true
  services:
    type: Object
    optional: true
    blackbox: true
  referrer:
    type: String
    optional: true
  nReferrals:
    type: Number
    optional: true
  # referrals:
  #   type: [String]
  #   optional: true
  referrals:
    type: [Schema.referral]
    optional: true
  rewards:
    type: [Schema.reward]
    optional: true
  restricted:
    type: Boolean
    optional: true
  lineQueuedAt:
    type: Date
    optional: true
  linePosition:
    type: Number
    optional: true
  nReferralsPaid:
    type: Number
    optional: true
  # referralsPaid:
  #   type: [String]
  #   optional: true
  referralsPaid:
    type: [Schema.referral]
    optional: true
  source:
    type: String
    optional: true
  username:
    type: String
    optional: true
  hidden:
    type: Boolean
    optional: true
  text:
    type: String
    optional: true
  disabled:
    type: Boolean
    optional: true

Meteor.users.attachSchema Schema.user

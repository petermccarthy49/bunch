function VenueModel(venueData) {
  this.name = venueData.name;
  this.fullAddress = venueData.fullAddress;
  this.lat = venueData.lat;
  this.lng = venueData.lng;
  this.priceTier = venueData.priceTier;
  this.rating = venueData.rating;
  this.category = venueData.category;
  this.id = venueData.id;
};

VenueModel.prototype.formattedAddress = function() {
  return this.fullAddress[0] + ', '
              + this.fullAddress[3];
};

VenueModel.prototype.formattedPriceTier = function() {
  if( isNaN(this.priceTier) ) { return 'N/A'; };
  return new Array( this.priceTier + 1 ).join('£');
};

VenueModel.prototype.starRating = function() {
  if( isNaN(this.rating) ) { return 'N/A'; };
  return strMultiply('★', this.rating / 2) 
            + strMultiply('☆', (10 - this.rating) / 2);
};

VenueModel.prototype.detailUrl = function() {
  return "https://foursquare.com/v/" + this.id;
};

function strMultiply(string,n) {
  return new Array( Math.round(n) + 1 ).join(string);
};
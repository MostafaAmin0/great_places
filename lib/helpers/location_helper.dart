const mapBoxApi =
    'pk.eyJ1IjoibW9zdGFmYWFtaW4iLCJhIjoiY2t4NmVkZWx1MWUzczJvcWs0YnByMHdzNCJ9.UHshS5I830SnNRnQq4odeQ';

class LocationHelper {
  static String generateLocationPreviewImage(
      double latitude, double longitude) {
    return 'https://api.mapbox.com/styles/v1/mapbox/streets-v11/static/pin-l($longitude,$latitude)/$longitude,$latitude,14.25,0,0/600x300?access_token=$mapBoxApi';
  }
}

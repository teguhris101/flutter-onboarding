class Country {
  final String name;
  final String code;
  final String country;
  final String desc;
  final double rate;
  final int temp;

  Country({
    required this.name,
    required this.country,
    required this.code,
    required this.temp,
    required this.rate,
    required this.desc,
  });
}

List<Country> popularCountries = [
  Country(
    name: 'Bali',
    country: 'Indonesia',
    code: "ID",
    desc: "BLabla",
    temp: 30,
    rate: 4.70,
  ),
  Country(
    name: 'Kuala Lumpur',
    country: 'Malaysia',
    code: "MY",
    desc: "BLabla",
    temp: 29,
    rate: 4.60,
  ),
  Country(
    name: 'Osaka',
    country: 'Japan',
    code: "JP",
    desc: "BLabla",
    temp: 19,
    rate: 4.90,
  ),
  Country(
    name: 'Tokyo',
    country: 'Japan',
    code: "JP",
    desc: "BLabla",
    temp: 22,
    rate: 4.85,
  ),
];

class Event {
  final String eventName;
  final String location;
  var image;
  Event({required this.eventName, required this.location, this.image});
}

List<Event> ongoingEvent = [
  Event(
    eventName: 'Rio Carnival, Rio de Janeiro',
    location: 'Brazil',
    image: 'rio',
  ),
  Event(
    eventName: 'Sapporo Snow Festival',
    location: 'Japan',
    image: 'sapporo',
  ),
];

String desc =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque elementum nibh justo, nec laoreet mi feugiat ac. Vestibulum rhoncus purus diam, id molestie risus accumsan sit amet. Integer eu metus eu mi convallis lobortis vitae eget dolor. Aliquam metus lorem, lacinia a tortor vitae, blandit blandit elit. Curabitur at condimentum lorem. Suspendisse ornare, sapien sit amet blandit molestie, urna libero rhoncus enim, at commodo magna enim sed eros. Cras ullamcorper fringilla mattis. Vestibulum finibus quam nec metus accumsan, vel hendrerit nunc auctor. Fusce orci nibh, laoreet in ante ac, gravida laoreet mauris. Nam ut faucibus mauris.${'\n\n'}Curabitur in facilisis augue. Nullam viverra tortor sed efficitur dictum. Donec pulvinar cursus eros nec euismod. Praesent fringilla enim lorem, a faucibus mauris facilisis sed. In laoreet id tortor at pellentesque. Fusce sit amet feugiat urna. Phasellus a orci sed leo faucibus bibendum. Morbi sodales est nec ligula convallis consectetur. Pellentesque ornare viverra diam aliquam volutpat. Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi bibendum mauris nec mauris faucibus convallis. Nam luctus nunc mi, eu venenatis diam cursus eget.";

var favPlace = [];

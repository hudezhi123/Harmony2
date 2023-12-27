interface ISplash {
  day: Resource[];
  dusk: Resource[];
  night: Resource[];
}

export const splashImages:ISplash = {
  day: [
  $r('app.media.splash1'),
  $r('app.media.splash2'),
  $r('app.media.splash3')
  ],
  dusk: [
  $r('app.media.splash4'),
  $r('app.media.splash5'),
  $r('app.media.splash6')
  ],
  night: [
  $r('app.media.splash7'),
  $r('app.media.splash8'),
  $r('app.media.splash9')
  ]
}
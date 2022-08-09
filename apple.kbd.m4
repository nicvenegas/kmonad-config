;; Based on keymap/template/apple.kbd

(defcfg
  ;; Override iokit-name as follows
  ;;
  ;;     kmonad --input "iokit-name 'Magic Keyboard'" apple.kbd
  ;;
  ;; See https://github.com/kmonad/kmonad/issues/156#issuecomment-748485220
  input (iokit-name "__NAME__")
  output (kext)
  fallthrough true
)

(defsrc
  esc  f1   f2   f3   f4   f5   f6   f7   f8   f9   f10  f11  f12
  grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
  tab  q    w    e    r    t    y    u    i    o    p    [    ]    \
  caps a    s    d    f    g    h    j    k    l    ;    '    ret
  lsft z    x    c    v    b    n    m    ,    .    /    rsft up
  fn   lctl lalt lmet           spc            rmet ralt left down rght
)


(defalias
  fn (around (layer-toggle function) fn)
  ext (layer-toggle extend)
  cag (around lctl (around lalt lmet))

  ;; Home row mods (https://precondition.github.io/home-row-mods)
  hra (tap-hold-next-release 200 a lctl)
  hrs (tap-hold-next-release 200 s lalt)
  hrd (tap-hold-next-release 200 d lmet)
  hrf (tap-hold-next-release 200 f lsft)

  hrj (tap-hold-next-release 200 j rsft)
  hrk (tap-hold-next-release 200 k rmet)
  hrl (tap-hold-next-release 200 l lalt)
  hr; (tap-hold-next-release 200 ; rctl)
)

(deflayer default
  _    _    _    _    _    _    _    _    _    _    _    _    _
  _    _    _    _    _    _    _    _    _    _    _    _    _    _
  _    _    _    _    _    _    _    _    _    _    _    _    _    _
  esc  @hra @hrs @hrd @hrf _    _    @hrj @hrk @hrl @hr; _    _
  _    _    _    _    _    _    _    _    _    _    _    _    _
  @fn  _    _    @ext           _              @cag  _    _    _    _
)

(deflayer function
  _    brdn brup mctl _    _    _    prev pp   next mute vold volu
  _    _    _    _    _    _    _    _    _    _    _    _    _    del
  _    _    _    _    _    _    _    _    _    _    _    _    _    _
  caps    _    _    _    _    _    _    _    _    _    _    _    _
  _    _    _    _    _    _    _    _    _    _    _    _    pgup
  _    _    _    _              _              _    _    home pgdn end
)


(defalias
  ;; Extend layer (https://dreymar.colemak.org/layers-extend.html)
  bck M-[
  fwd M-]
  udo M-z
  cut M-x
  cpy M-c
  pst M-v

  ;; Left hand affordances
  cq M-q
  cw M-w
  ct M-t
  cg M-g
)

(deflayer extend
  _    _    _    _    _    _    _    _    _    _    _    _    _
  _    f1   f2   f3   f4   f5   f6   f7   f8   f9   f10  f11  f12  _
  _    @cq  @cw  @bck @fwd @ct  pgup home up   end  del  _    _    _
  _    lctl lalt lmet lsft @cg  pgdn left down rght bspc _    _
  _    @udo @cut @cpy @pst _    _    _    _    _    _    _    _
  _    _    _    _              _              _    _    _    _    _
 )

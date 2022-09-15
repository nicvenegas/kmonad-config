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
  hrr (tap-hold-next-release 200 r lalt)
  hrs (tap-hold-next-release 200 s lmet)
  hrt (tap-hold-next-release 200 t lsft)

  hrn (tap-hold-next-release 200 n rsft)
  hre (tap-hold-next-release 200 e rmet)
  hri (tap-hold-next-release 200 i lalt)
  hro (tap-hold-next-release 200 o rctl)
)

(deflayer default
  _    _    _    _    _    _    _    _    _    _    _    _    _
  _    _    _    _    _    _    _    _    _    _    _    _    _    _
  _    q    w    f    p    b    j    l    u    y    ;    _    _    _
  esc  @hra @hrr @hrs @hrt g    m    @hrn @hre @hri @hro _    _
  z    x    c    d    v    \    k    h    _    _    _    _    _
  @fn  _    _    @ext           _              @cag  @cag  _    _    _
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
  cg M-g
)

(deflayer extend
  _    _    _    _    _    _    _    _    _    _    _    _    _
  _    f1   f2   f3   f4   f5   f6   f7   f8   f9   f10  f11  f12  _
  _    @cq  @cw  @bck @fwd _    pgup home up   end  del  _    _    _
  _    lctl lalt lmet lsft @cg  pgdn left down rght bspc _    _
  _    @udo @cut @cpy @pst _    _    _    _    _    _    _    _
  _    _    _    _              _              _    _    _    _    _
 )

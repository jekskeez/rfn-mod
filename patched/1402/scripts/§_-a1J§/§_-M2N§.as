package §_-a1J§
{
   import §_-48§.ListDataEvent;
   import §_-B1G§.ScrollPane;
   import §_-S1n§.§_-kr§;
   import §_-bN§.Dialog;
   import §_-c2C§.§_-u24§;
   import §_-cA§.§_-S2N§;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import sounds.GameSounds;
   import sounds.§_-RH§;
   import utils.§_-J1f§;
   import utils.§_-y1l§;
   import views.§_-91L§;
   import views.§_-9i§;
   
   public class §_-M2N§ extends Dialog
   {
      
      public static const WIDTH:int = 359;
      
      public static const §_-e2X§:int = 264;
      
      public static const §_-d1D§:int = 117;
      
      protected static const §_-B1§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,14,8746579,null,null,null,null,null,TextFormatAlign.CENTER);
      
      private static const §_-h13§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,30,16777215,null,null,null,null,null,TextFormatAlign.CENTER);
      
      private static const §_-M0§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,13,16777215,false,null,null,null,null,TextFormatAlign.LEFT);
      
      protected var §_-V1I§:Sprite = null;
      
      protected var §_-22S§:§_-i5§ = null;
      
      protected var §_-R1I§:§_-91L§ = null;
      
      protected var §_-Bo§:§_-S2N§ = null;
      
      protected var §_-G19§:§_-9i§ = null;
      
      protected var bg:DialogBaseBackground = null;
      
      protected var §_-Q2F§:Sprite = null;
      
      protected var animation:MovieClip = null;
      
      protected var §_-s2§:§_-J1f§ = null;
      
      protected var §_-M1p§:§_-i5§ = null;
      
      protected var §_-W18§:ScrollPane = null;
      
      protected var §_-51V§:Sprite = null;
      
      private var §_-t2Y§:Sprite = null;
      
      private var §_-bC§:SimpleButton = null;
      
      private var §_-Y27§:Sprite = null;
      
      private var §_-Fs§:Sprite = null;
      
      private var §_-33u§:int = 0;
      
      public function §_-M2N§(param1:Class)
      {
         super(null,false,true,null,false);
         this.setDefaultSize();
         this.init(param1);
         this.§_-oX§ = true;
         initClose();
         this.§_-x2T§.x = 330;
         this.§_-x2T§.y = 32;
         this.sound = "";
      }
      
      override public function show() : void
      {
         super.show();
         this.§_-B1Z§ = false;
         placeInCenter();
         if(this.§_-bC§)
         {
            this.§_-bC§.enabled = true;
            this.§_-bC§.filters = null;
         }
         if(this.§_-t2Y§)
         {
            this.§_-R1I§.x = 0;
            this.§_-R1I§.y = 40;
            this.§_-t2Y§.addChild(this.§_-R1I§);
         }
         if(Hero.self)
         {
            Hero.self.§_-J1G§(false);
         }
      }
      
      public function §_-yA§(param1:Array) : void
      {
         this.§_-G19§.set(param1);
         this.§_-W18§.update();
      }
      
      public function §_-41n§(param1:int, param2:int) : void
      {
         this.§_-G19§.inHollow(param1,param2);
      }
      
      override protected function setDefaultSize() : void
      {
         this.§_-01q§ = -150;
         this.§_-7N§ = 0;
         this.topOffset = -80;
         this.§_-f2d§ = 0;
      }
      
      protected function init(param1:Class) : void
      {
         var _loc2_:int = §_-e2X§;
         this.§_-Q2F§ = new Sprite();
         addChild(this.§_-Q2F§);
         this.animation = new param1();
         this.animation.x = 175;
         this.animation.y = 63;
         this.§_-Q2F§.addChild(this.animation);
         this.bg = new DialogBaseBackground();
         this.bg.width = WIDTH;
         this.bg.height = _loc2_;
         addChild(this.bg);
         this.§_-s2§ = §_-J1f§.replace(new ImageRibborn());
         this.§_-s2§.stop();
         addChild(this.§_-s2§);
         this.§_-s2§.x = -30;
         this.§_-s2§.y = -40;
         var _loc3_:§_-i5§ = new §_-i5§(gls("Развернуть"),153,-2,§_-M0§,190);
         this.§_-Fs§ = new ButtonMaximize();
         this.§_-Fs§.buttonMode = true;
         this.§_-Fs§.addChild(_loc3_);
         this.§_-Fs§.x = 3;
         this.§_-Fs§.y = _loc2_ - 24;
         this.§_-Fs§.addEventListener(MouseEvent.CLICK,this.§_-l2R§);
         this.addChild(this.§_-Fs§);
         var _loc4_:§_-i5§ = new §_-i5§(gls("Свернуть"),153,-2,§_-M0§,190);
         this.§_-Y27§ = new ButtonMaximize();
         this.§_-Y27§.addChild(_loc4_);
         this.§_-Y27§.buttonMode = true;
         this.§_-Y27§.x = 3;
         this.§_-Y27§.y = _loc2_ - 24;
         this.§_-Y27§.addEventListener(MouseEvent.CLICK,this.§_-83W§);
         this.addChild(this.§_-Y27§);
         this.§_-M1p§ = new §_-i5§("",-23,-21,§_-h13§,401);
         this.§_-M1p§.filters = [new DropShadowFilter(0,0,532282,1,3,3,2)];
         addChild(this.§_-M1p§);
         this.§_-22S§ = new §_-i5§(gls("твоя награда"),0,31,§_-B1§,WIDTH);
         this.addChild(this.§_-22S§);
         this.§_-t2Y§ = new Sprite();
         this.§_-t2Y§.y = _loc2_ - 96;
         addChild(this.§_-t2Y§);
         this.§_-bC§ = new ButtonChangeRoom();
         this.§_-bC§.addEventListener(MouseEvent.CLICK,this.§_-Wg§);
         this.§_-bC§.x = int((WIDTH - this.§_-bC§.width) * 0.5);
         this.§_-bC§.y = 0;
         new §_-kr§(this.§_-bC§,gls("Перейти на следующую карту\nВнимание! Ты покинешь этих белок и присоединишься к другим!"));
         this.§_-t2Y§.addChild(this.§_-bC§);
         this.§_-R1I§ = §_-91L§.instance;
         this.§_-G19§ = new §_-9i§();
         this.§_-G19§.addEventListener(ListDataEvent.SORTED,this.§_-ZV§);
         this.§_-G19§.addEventListener(ListDataEvent.UPDATE,this.§_-O2K§);
         this.§_-Bo§ = new §_-S2N§();
         this.§_-Bo§.x = WIDTH * 0.5 - 125;
         this.§_-Bo§.y = 36;
         this.§_-Bo§.setData(this.§_-G19§);
         GameSounds.play(§_-RH§.§_-K10§);
         this.§_-V1I§ = new Sprite();
         this.addChild(this.§_-V1I§);
         this.§_-W18§ = new ScrollPane();
         this.§_-V1I§.addChild(this.§_-W18§);
         this.§_-W18§.x = 0;
         this.§_-W18§.y = 25;
         this.§_-W18§.setSize(350,106);
         this.§_-51V§ = new Sprite();
         this.§_-51V§.addChild(this.§_-Bo§);
         this.§_-Bo§.y = 0;
         this.§_-W18§.source = this.§_-51V§;
         this.§_-W18§.update();
         this.setBgHeight = 264;
      }
      
      protected function §_-O2K§(param1:ListDataEvent) : void
      {
         if(this.§_-W18§)
         {
            this.§_-W18§.update();
         }
      }
      
      protected function §_-ZV§(param1:ListDataEvent) : void
      {
         if(this.§_-W18§)
         {
            this.§_-W18§.update();
         }
      }
      
      protected function set setBgHeight(param1:int) : void
      {
         this.§_-33u§ = param1;
         if(this.bg)
         {
            this.bg.height = param1;
         }
         if(Boolean(this.§_-Fs§) && Boolean(this.§_-Y27§))
         {
            this.§_-Fs§.y = param1 - 24;
            this.§_-Y27§.y = param1 - 24 + §_-d1D§;
         }
         this.§_-V1I§.y = param1 - 45;
         if(this.§_-t2Y§)
         {
            this.§_-t2Y§.y = param1 - 106;
         }
      }
      
      protected function set §_-B1Z§(param1:Boolean) : void
      {
         this.§_-V1I§.visible = param1;
         if(this.bg)
         {
            this.bg.height = param1 ? this.§_-33u§ + §_-d1D§ : this.§_-33u§;
         }
         if(Boolean(this.§_-Fs§) && Boolean(this.§_-Y27§))
         {
            this.§_-Fs§.visible = !param1;
            this.§_-Y27§.visible = param1;
         }
      }
      
      private function §_-Wg§(param1:Event) : void
      {
         §_-u24§.§_-Wg§();
         this.§_-bC§.enabled = false;
         this.§_-bC§.filters = §_-y1l§.§_-Tk§;
      }
      
      private function §_-l2R§(param1:MouseEvent) : void
      {
         this.§_-B1Z§ = true;
      }
      
      private function §_-83W§(param1:MouseEvent) : void
      {
         this.§_-B1Z§ = false;
      }
   }
}


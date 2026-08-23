package §_-63u§
{
   import §_-5C§.ListDataEvent;
   import §_-Kr§.ScrollPane;
   import §_-T2y§.§_-92z§;
   import §_-X1o§.§_-ZT§;
   import §_-e1G§.§_-Hb§;
   import §_-k1c§.Dialog;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import sounds.GameSounds;
   import sounds.§_-43Z§;
   import utils.§_-A3M§;
   import utils.§_-x1Z§;
   import views.§_-BR§;
   import views.§_-TP§;
   
   public class §_-31r§ extends Dialog
   {
      
      public static const WIDTH:int = 359;
      
      public static const §_-gT§:int = 264;
      
      public static const §_-U2S§:int = 117;
      
      protected static const §_-L2Y§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,14,8746579,null,null,null,null,null,TextFormatAlign.CENTER);
      
      private static const §_-63x§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,30,16777215,null,null,null,null,null,TextFormatAlign.CENTER);
      
      private static const §_-v1Z§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,13,16777215,false,null,null,null,null,TextFormatAlign.LEFT);
      
      protected var §_-Q1H§:Sprite = null;
      
      protected var §_-J2C§:§_-22V§ = null;
      
      protected var §_-HH§:§_-BR§ = null;
      
      protected var §_-N19§:§_-ZT§ = null;
      
      protected var §_-w2T§:§_-TP§ = null;
      
      protected var bg:DialogBaseBackground = null;
      
      protected var §_-O1B§:Sprite = null;
      
      protected var animation:MovieClip = null;
      
      protected var §_-b2s§:§_-A3M§ = null;
      
      protected var §_-h1X§:§_-22V§ = null;
      
      protected var §_-M1N§:ScrollPane = null;
      
      protected var §_-Lv§:Sprite = null;
      
      private var §_-s1S§:Sprite = null;
      
      private var §_-b14§:SimpleButton = null;
      
      private var §_-UH§:Sprite = null;
      
      private var §_-7K§:Sprite = null;
      
      private var §_-D2c§:int = 0;
      
      public function §_-31r§(param1:Class)
      {
         super(null,false,true,null,false);
         this.setDefaultSize();
         this.init(param1);
         this.§_-Q2G§ = true;
         initClose();
         this.§_-O2e§.x = 330;
         this.§_-O2e§.y = 32;
         this.sound = "";
      }
      
      override public function show() : void
      {
         super.show();
         this.§_-H2M§ = false;
         placeInCenter();
         if(this.§_-b14§)
         {
            this.§_-b14§.enabled = true;
            this.§_-b14§.filters = null;
         }
         if(this.§_-s1S§)
         {
            this.§_-HH§.x = 0;
            this.§_-HH§.y = 40;
            this.§_-s1S§.addChild(this.§_-HH§);
         }
         if(Hero.self)
         {
            Hero.self.§_-EV§(false);
         }
      }
      
      public function §_-62k§(param1:Array) : void
      {
         this.§_-w2T§.set(param1);
         this.§_-M1N§.update();
      }
      
      public function §_-13t§(param1:int, param2:int) : void
      {
         this.§_-w2T§.inHollow(param1,param2);
      }
      
      override protected function setDefaultSize() : void
      {
         this.§_-R1Y§ = -150;
         this.§_-4n§ = 0;
         this.topOffset = -80;
         this.§_-JZ§ = 0;
      }
      
      protected function init(param1:Class) : void
      {
         var _loc2_:int = §_-gT§;
         this.§_-O1B§ = new Sprite();
         addChild(this.§_-O1B§);
         this.animation = new param1();
         this.animation.x = 175;
         this.animation.y = 63;
         this.§_-O1B§.addChild(this.animation);
         this.bg = new DialogBaseBackground();
         this.bg.width = WIDTH;
         this.bg.height = _loc2_;
         addChild(this.bg);
         this.§_-b2s§ = §_-A3M§.replace(new ImageRibborn());
         this.§_-b2s§.stop();
         addChild(this.§_-b2s§);
         this.§_-b2s§.x = -30;
         this.§_-b2s§.y = -40;
         var _loc3_:§_-22V§ = new §_-22V§(gls("Развернуть"),153,-2,§_-v1Z§,190);
         this.§_-7K§ = new ButtonMaximize();
         this.§_-7K§.buttonMode = true;
         this.§_-7K§.addChild(_loc3_);
         this.§_-7K§.x = 3;
         this.§_-7K§.y = _loc2_ - 24;
         this.§_-7K§.addEventListener(MouseEvent.CLICK,this.§_-f1v§);
         this.addChild(this.§_-7K§);
         var _loc4_:§_-22V§ = new §_-22V§(gls("Свернуть"),153,-2,§_-v1Z§,190);
         this.§_-UH§ = new ButtonMaximize();
         this.§_-UH§.addChild(_loc4_);
         this.§_-UH§.buttonMode = true;
         this.§_-UH§.x = 3;
         this.§_-UH§.y = _loc2_ - 24;
         this.§_-UH§.addEventListener(MouseEvent.CLICK,this.§_-z11§);
         this.addChild(this.§_-UH§);
         this.§_-h1X§ = new §_-22V§("",-23,-21,§_-63x§,401);
         this.§_-h1X§.filters = [new DropShadowFilter(0,0,532282,1,3,3,2)];
         addChild(this.§_-h1X§);
         this.§_-J2C§ = new §_-22V§(gls("твоя награда"),0,31,§_-L2Y§,WIDTH);
         this.addChild(this.§_-J2C§);
         this.§_-s1S§ = new Sprite();
         this.§_-s1S§.y = _loc2_ - 96;
         addChild(this.§_-s1S§);
         this.§_-b14§ = new ButtonChangeRoom();
         this.§_-b14§.addEventListener(MouseEvent.CLICK,this.§_-V2l§);
         this.§_-b14§.x = int((WIDTH - this.§_-b14§.width) * 0.5);
         this.§_-b14§.y = 0;
         new §_-Hb§(this.§_-b14§,gls("Перейти на следующую карту\nВнимание! Ты покинешь этих белок и присоединишься к другим!"));
         this.§_-s1S§.addChild(this.§_-b14§);
         this.§_-HH§ = §_-BR§.instance;
         this.§_-w2T§ = new §_-TP§();
         this.§_-w2T§.addEventListener(ListDataEvent.SORTED,this.§_-l2F§);
         this.§_-w2T§.addEventListener(ListDataEvent.UPDATE,this.§_-o14§);
         this.§_-N19§ = new §_-ZT§();
         this.§_-N19§.x = WIDTH * 0.5 - 125;
         this.§_-N19§.y = 36;
         this.§_-N19§.setData(this.§_-w2T§);
         GameSounds.play(§_-43Z§.§_-o1e§);
         this.§_-Q1H§ = new Sprite();
         this.addChild(this.§_-Q1H§);
         this.§_-M1N§ = new ScrollPane();
         this.§_-Q1H§.addChild(this.§_-M1N§);
         this.§_-M1N§.x = 0;
         this.§_-M1N§.y = 25;
         this.§_-M1N§.setSize(350,106);
         this.§_-Lv§ = new Sprite();
         this.§_-Lv§.addChild(this.§_-N19§);
         this.§_-N19§.y = 0;
         this.§_-M1N§.source = this.§_-Lv§;
         this.§_-M1N§.update();
         this.setBgHeight = 264;
      }
      
      protected function §_-o14§(param1:ListDataEvent) : void
      {
         if(this.§_-M1N§)
         {
            this.§_-M1N§.update();
         }
      }
      
      protected function §_-l2F§(param1:ListDataEvent) : void
      {
         if(this.§_-M1N§)
         {
            this.§_-M1N§.update();
         }
      }
      
      protected function set setBgHeight(param1:int) : void
      {
         this.§_-D2c§ = param1;
         if(this.bg)
         {
            this.bg.height = param1;
         }
         if(Boolean(this.§_-7K§) && Boolean(this.§_-UH§))
         {
            this.§_-7K§.y = param1 - 24;
            this.§_-UH§.y = param1 - 24 + §_-U2S§;
         }
         this.§_-Q1H§.y = param1 - 45;
         if(this.§_-s1S§)
         {
            this.§_-s1S§.y = param1 - 106;
         }
      }
      
      protected function set §_-H2M§(param1:Boolean) : void
      {
         this.§_-Q1H§.visible = param1;
         if(this.bg)
         {
            this.bg.height = param1 ? this.§_-D2c§ + §_-U2S§ : this.§_-D2c§;
         }
         if(Boolean(this.§_-7K§) && Boolean(this.§_-UH§))
         {
            this.§_-7K§.visible = !param1;
            this.§_-UH§.visible = param1;
         }
      }
      
      private function §_-V2l§(param1:Event) : void
      {
         §_-92z§.§_-V2l§();
         this.§_-b14§.enabled = false;
         this.§_-b14§.filters = §_-x1Z§.§_-c2G§;
      }
      
      private function §_-f1v§(param1:MouseEvent) : void
      {
         this.§_-H2M§ = true;
      }
      
      private function §_-z11§(param1:MouseEvent) : void
      {
         this.§_-H2M§ = false;
      }
   }
}


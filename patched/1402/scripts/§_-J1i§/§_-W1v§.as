package §_-J1i§
{
   import §_-J19§.§_-534§;
   import §_-S1n§.§_-kr§;
   import §_-X1k§.EventsManager;
   import §_-X1k§.NotificationManager;
   import §_-X1k§.NuttyPassManager;
   import §_-X1k§.§_-z9§;
   import §_-bN§.§_-RY§;
   import §_-c2C§.§_-51A§;
   import §_-c2C§.§_-P1w§;
   import §_-c2C§.§_-j2f§;
   import §_-c2C§.§_-si§;
   import §_-c2C§.§_-t2c§;
   import §_-c2C§.§_-x2y§;
   import §_-s2e§.§_-U2d§;
   import buttons.§_-Hg§;
   import buttons.§_-uH§;
   import events.ScreenEvent;
   import flash.display.DisplayObject;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import sounds.GameSounds;
   import sounds.§_-RH§;
   import views.§_-73s§;
   import views.§_-O2q§;
   
   public class §_-W1v§ extends Sprite
   {
      
      private static var _instance:§_-W1v§;
      
      private var background:Sprite;
      
      private var §_-6L§:§_-73s§;
      
      private var group:§_-Hg§;
      
      private var §_-92T§:Sprite;
      
      private var §_-a1S§:Array = [];
      
      private var §_-M1e§:Number = 0;
      
      private var §_-V2f§:SimpleButton;
      
      private var §_-LX§:SimpleButton;
      
      private var §_-431§:§_-uH§;
      
      private var §_-k2z§:§_-uH§;
      
      private var §_-11H§:§_-uH§;
      
      private var §_-u1E§:SimpleButton;
      
      private var §_-m27§:§_-i2O§;
      
      public function §_-W1v§()
      {
         _instance = this;
         super();
         this.init();
         this.visible = false;
         §_-t2c§.instance.addEventListener(ScreenEvent.SHOW,this.§_-43K§);
      }
      
      public static function §_-83E§(param1:Boolean) : void
      {
         _instance.§_-m27§.update(param1);
      }
      
      public static function update() : void
      {
         _instance.update();
      }
      
      public static function show() : void
      {
         _instance.visible = true;
         _instance.update();
      }
      
      public static function hide() : void
      {
         _instance.visible = false;
      }
      
      public static function §_-22v§() : void
      {
         if(!_instance)
         {
            return;
         }
         _instance.§_-L2O§();
      }
      
      private function §_-L2O§() : void
      {
         var _loc3_:DisplayObject = null;
         var _loc4_:Number = NaN;
         this.§_-a1S§ = [];
         if(this.§_-u1E§)
         {
            this.§_-a1S§.push(this.§_-u1E§);
         }
         this.§_-a1S§.push(this.§_-431§,this.§_-k2z§,this.§_-LX§,this.§_-V2f§,this.§_-11H§);
         var _loc1_:Number = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-a1S§.length)
         {
            _loc3_ = this.§_-a1S§[_loc2_];
            _loc3_.x = _loc1_;
            _loc4_ = 60;
            if(_loc3_ == this.§_-V2f§)
            {
               _loc4_ = 55;
            }
            _loc1_ += _loc4_;
            _loc2_++;
         }
         this.§_-M1e§ = _loc1_;
         this.background.x = -33;
         this.background.width = this.§_-M1e§ + 33;
         if(this.§_-m27§)
         {
            this.§_-m27§.x = this.§_-M1e§ - 325;
         }
         this.§_-6L§.x = 5;
         this.§_-92T§.x = Game.starling.stage.stageWidth - this.§_-M1e§;
      }
      
      private function init() : void
      {
         addChild(new HeaderLeftBack());
         this.§_-92T§ = new Sprite();
         addChild(this.§_-92T§);
         this.background = new HeaderRightBack();
         this.§_-92T§.addChild(this.background);
         this.§_-6L§ = new §_-73s§(new PhotoHeaderFrame());
         this.§_-6L§.x = 5;
         addChild(this.§_-6L§);
         var _loc1_:Boolean = §_-z9§.§_-SC§(§_-z9§.§_-bp§) != null;
         if(_loc1_)
         {
            this.§_-u1E§ = new ButtonHeaderNuttyPass();
            this.§_-u1E§.y = 37;
            this.§_-u1E§.addEventListener(MouseEvent.CLICK,this.§_-q1w§);
            this.§_-u1E§.addEventListener(MouseEvent.MOUSE_OVER,this.§_-wr§);
            this.§_-92T§.addChild(this.§_-u1E§);
            new §_-kr§(this.§_-u1E§,gls("Ореховый Пропуск"));
            NotificationManager.instance.§_-a1K§(NotificationManager.§_-b1B§,new §_-O2q§(this.§_-u1E§,10,10));
         }
         this.§_-431§ = new §_-uH§(new ButtonHeaderPlanet());
         this.§_-431§.y = 35;
         this.§_-431§.addEventListener(MouseEvent.CLICK,this.§_-b1O§);
         this.§_-431§.addEventListener(MouseEvent.MOUSE_OVER,this.§_-d2f§);
         this.§_-92T§.addChild(this.§_-431§);
         new §_-kr§(this.§_-431§,gls("Планета"));
         this.§_-k2z§ = new §_-uH§(new ButtonHeaderHome());
         this.§_-k2z§.y = 35;
         this.§_-k2z§.addEventListener(MouseEvent.CLICK,this.§_-LR§);
         this.§_-k2z§.addEventListener(MouseEvent.ROLL_OVER,this.§_-H11§);
         this.§_-k2z§.addEventListener(MouseEvent.ROLL_OUT,this.§_-T1o§);
         this.§_-92T§.addChild(this.§_-k2z§);
         new §_-kr§(this.§_-k2z§,gls("Домик"));
         NotificationManager.instance.§_-a1K§(NotificationManager.§_-Xd§ | NotificationManager.§_-T1Z§ | NotificationManager.§_-J1u§,new §_-O2q§(this.§_-k2z§.getChildAt(0),10,10));
         this.§_-LX§ = §_-Zy§.§_-BI§ ? new ButtonHeaderShopRu() : new ButtonHeaderShopEn();
         this.§_-LX§.y = 35;
         this.§_-LX§.addEventListener(MouseEvent.CLICK,this.§_-G2T§);
         this.§_-LX§.addEventListener(MouseEvent.MOUSE_OVER,this.§_-P1v§);
         this.§_-92T§.addChild(this.§_-LX§);
         new §_-kr§(this.§_-LX§,gls("Магазин"));
         NotificationManager.instance.§_-a1K§(NotificationManager.§_-K2A§,new §_-O2q§(this.§_-LX§,10,10));
         this.§_-V2f§ = new ButtonHeaderNews();
         this.§_-V2f§.y = 35;
         this.§_-V2f§.addEventListener(MouseEvent.CLICK,this.§_-w1n§);
         this.§_-V2f§.addEventListener(MouseEvent.MOUSE_OVER,this.§_-j1z§);
         this.§_-92T§.addChild(this.§_-V2f§);
         new §_-kr§(this.§_-V2f§,gls("Новости"));
         NotificationManager.instance.§_-a1K§(NotificationManager.§_-FM§,new §_-O2q§(this.§_-V2f§,10,10));
         this.§_-11H§ = new §_-uH§(new ButtonHeaderRating());
         this.§_-11H§.y = 40;
         this.§_-11H§.addEventListener(MouseEvent.CLICK,this.§_-v§);
         this.§_-11H§.addEventListener(MouseEvent.MOUSE_OVER,this.§_-Bg§);
         this.§_-92T§.addChild(this.§_-11H§);
         new §_-kr§(this.§_-11H§,gls("Рейтинги"));
         this.group = new §_-Hg§();
         this.group.insert(this.§_-431§);
         this.group.insert(this.§_-k2z§);
         this.group.insert(this.§_-11H§);
         this.group.§_-l1Y§(this.§_-431§);
         this.§_-92T§.addChild(this.group);
         this.§_-m27§ = new §_-i2O§();
         this.§_-m27§.hide();
         this.§_-92T§.addChildAt(this.§_-m27§,0);
         EventsManager.addEventListener(EventsManager.CHANGE,this.§_-s2q§);
         this.§_-L2O§();
      }
      
      private function §_-Bg§(param1:MouseEvent) : void
      {
         GameSounds.play("reiting",true);
      }
      
      private function §_-j1z§(param1:MouseEvent) : void
      {
         GameSounds.play("paper",true);
      }
      
      private function §_-P1v§(param1:MouseEvent) : void
      {
         GameSounds.play("icon_shop_1",true);
      }
      
      private function §_-d2f§(param1:MouseEvent) : void
      {
         GameSounds.play("main_screen",true);
      }
      
      private function §_-wr§(param1:MouseEvent) : void
      {
         GameSounds.play("nutty_pass",true);
      }
      
      private function update() : void
      {
         if(Game.self == null)
         {
            return;
         }
         this.§_-6L§.§_-yC§(Game.self);
      }
      
      private function §_-s2q§(param1:Event) : void
      {
         if(!this.§_-u1E§ || Boolean(§_-z9§.§_-SC§(§_-z9§.§_-bp§)))
         {
            return;
         }
         this.§_-92T§.removeChild(this.§_-u1E§);
         this.§_-u1E§ = null;
         this.§_-L2O§();
      }
      
      private function §_-q1w§(param1:MouseEvent) : void
      {
         NuttyPassManager.§_-L1f§();
      }
      
      private function §_-b1O§(param1:MouseEvent) : void
      {
         §_-t2c§.show("Location");
      }
      
      private function §_-LR§(param1:MouseEvent) : void
      {
         §_-51A§.§_-h2w§(Game.selfId);
         §_-t2c§.show(§_-51A§.instance);
      }
      
      private function §_-w1n§(param1:MouseEvent = null) : void
      {
         GameSounds.play(§_-RH§.§_-K10§,true);
         §_-RY§.show(true);
      }
      
      private function §_-G2T§(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         GameSounds.play(§_-RH§.§_-K10§,true);
         §_-U2d§.load(function():void
         {
            §_-534§.instance.show();
         });
      }
      
      private function §_-v§(param1:MouseEvent) : void
      {
         §_-t2c§.show(§_-j2f§.instance);
      }
      
      private function §_-H11§(param1:MouseEvent) : void
      {
         GameSounds.play("hous",true);
         if(§_-t2c§.active is §_-si§ || §_-t2c§.active is §_-51A§ || §_-t2c§.active is §_-P1w§ || §_-t2c§.active is §_-x2y§)
         {
            this.§_-m27§.show();
         }
      }
      
      private function §_-T1o§(param1:MouseEvent) : void
      {
         if(this.§_-m27§.visible)
         {
            this.§_-m27§.§_-c1H§();
         }
      }
      
      private function §_-43K§(param1:ScreenEvent) : void
      {
         if(param1.screen is §_-si§)
         {
            this.group.§_-l1Y§(this.§_-431§);
         }
         else if(param1.screen is §_-j2f§)
         {
            this.group.§_-l1Y§(this.§_-11H§);
         }
         else if(param1.screen is §_-51A§)
         {
            this.group.§_-l1Y§(this.§_-k2z§);
         }
         §_-83E§(param1.screen is §_-51A§);
      }
   }
}


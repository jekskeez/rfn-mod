package §_-e2w§
{
   import §_-68§.§_-EI§;
   import §_-D2q§.§_-m1L§;
   import §_-I10§.EventsManager;
   import §_-I10§.NotificationManager;
   import §_-I10§.NuttyPassManager;
   import §_-I10§.§_-K1X§;
   import §_-T2y§.§_-5B§;
   import §_-T2y§.§_-5K§;
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-F2y§;
   import §_-T2y§.§_-J2n§;
   import §_-T2y§.§_-ac§;
   import §_-e1G§.§_-Hb§;
   import §_-k1c§.§_-9f§;
   import buttons.§_-F1F§;
   import buttons.§_-G2L§;
   import events.ScreenEvent;
   import flash.display.DisplayObject;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import sounds.GameSounds;
   import sounds.§_-43Z§;
   import views.§_-E8§;
   import views.§_-Z2J§;
   
   public class §_-1W§ extends Sprite
   {
      
      private static var _instance:§_-1W§;
      
      private var background:Sprite;
      
      private var §_-fl§:§_-Z2J§;
      
      private var group:§_-G2L§;
      
      private var §_-71r§:Sprite;
      
      private var §_-l1P§:Array = [];
      
      private var §_-G1l§:Number = 0;
      
      private var §_-al§:SimpleButton;
      
      private var §_-C2z§:SimpleButton;
      
      private var §_-t1Q§:§_-F1F§;
      
      private var §_-e1n§:§_-F1F§;
      
      private var §_-W1m§:§_-F1F§;
      
      private var §_-r2f§:SimpleButton;
      
      private var §_-I7§:§_-31V§;
      
      public function §_-1W§()
      {
         _instance = this;
         super();
         this.init();
         this.visible = false;
         §_-71o§.instance.addEventListener(ScreenEvent.SHOW,this.§_-C2D§);
      }
      
      public static function §_-Q1v§(param1:Boolean) : void
      {
         _instance.§_-I7§.update(param1);
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
      
      public static function §_-V1Q§() : void
      {
         if(!_instance)
         {
            return;
         }
         _instance.§_-D2K§();
      }
      
      private function §_-D2K§() : void
      {
         var _loc3_:DisplayObject = null;
         var _loc4_:Number = NaN;
         this.§_-l1P§ = [];
         if(this.§_-r2f§)
         {
            this.§_-l1P§.push(this.§_-r2f§);
         }
         this.§_-l1P§.push(this.§_-t1Q§,this.§_-e1n§,this.§_-C2z§,this.§_-al§,this.§_-W1m§);
         var _loc1_:Number = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-l1P§.length)
         {
            _loc3_ = this.§_-l1P§[_loc2_];
            _loc3_.x = _loc1_;
            _loc4_ = 60;
            if(_loc3_ == this.§_-al§)
            {
               _loc4_ = 55;
            }
            _loc1_ += _loc4_;
            _loc2_++;
         }
         this.§_-G1l§ = _loc1_;
         this.background.x = -33;
         this.background.width = this.§_-G1l§ + 33;
         if(this.§_-I7§)
         {
            this.§_-I7§.x = this.§_-G1l§ - 325;
         }
         this.§_-fl§.x = 5;
         this.§_-71r§.x = Game.starling.stage.stageWidth - this.§_-G1l§;
      }
      
      private function init() : void
      {
         addChild(new HeaderLeftBack());
         this.§_-71r§ = new Sprite();
         addChild(this.§_-71r§);
         this.background = new HeaderRightBack();
         this.§_-71r§.addChild(this.background);
         this.§_-fl§ = new §_-Z2J§(new PhotoHeaderFrame());
         this.§_-fl§.x = 5;
         addChild(this.§_-fl§);
         var _loc1_:Boolean = §_-K1X§.§_-e1K§(§_-K1X§.§_-T1I§) != null;
         if(_loc1_)
         {
            this.§_-r2f§ = new ButtonHeaderNuttyPass();
            this.§_-r2f§.y = 37;
            this.§_-r2f§.addEventListener(MouseEvent.CLICK,this.§_-i0§);
            this.§_-r2f§.addEventListener(MouseEvent.MOUSE_OVER,this.§_-p2E§);
            this.§_-71r§.addChild(this.§_-r2f§);
            new §_-Hb§(this.§_-r2f§,gls("Ореховый Пропуск"));
            NotificationManager.instance.§_-P2Y§(NotificationManager.§_-Ee§,new §_-E8§(this.§_-r2f§,10,10));
         }
         this.§_-t1Q§ = new §_-F1F§(new ButtonHeaderPlanet());
         this.§_-t1Q§.y = 35;
         this.§_-t1Q§.addEventListener(MouseEvent.CLICK,this.§_-S1z§);
         this.§_-t1Q§.addEventListener(MouseEvent.MOUSE_OVER,this.§_-s1j§);
         this.§_-71r§.addChild(this.§_-t1Q§);
         new §_-Hb§(this.§_-t1Q§,gls("Планета"));
         this.§_-e1n§ = new §_-F1F§(new ButtonHeaderHome());
         this.§_-e1n§.y = 35;
         this.§_-e1n§.addEventListener(MouseEvent.CLICK,this.§_-6H§);
         this.§_-e1n§.addEventListener(MouseEvent.ROLL_OVER,this.§_-yM§);
         this.§_-e1n§.addEventListener(MouseEvent.ROLL_OUT,this.§_-E2s§);
         this.§_-71r§.addChild(this.§_-e1n§);
         new §_-Hb§(this.§_-e1n§,gls("Домик"));
         NotificationManager.instance.§_-P2Y§(NotificationManager.§_-M0§ | NotificationManager.§_-V1P§ | NotificationManager.§_-D14§,new §_-E8§(this.§_-e1n§.getChildAt(0),10,10));
         this.§_-C2z§ = §_-a9§.§_-sc§ ? new ButtonHeaderShopRu() : new ButtonHeaderShopEn();
         this.§_-C2z§.y = 35;
         this.§_-C2z§.addEventListener(MouseEvent.CLICK,this.§_-r1S§);
         this.§_-C2z§.addEventListener(MouseEvent.MOUSE_OVER,this.§_-51n§);
         this.§_-71r§.addChild(this.§_-C2z§);
         new §_-Hb§(this.§_-C2z§,gls("Магазин"));
         NotificationManager.instance.§_-P2Y§(NotificationManager.§_-X1A§,new §_-E8§(this.§_-C2z§,10,10));
         this.§_-al§ = new ButtonHeaderNews();
         this.§_-al§.y = 35;
         this.§_-al§.addEventListener(MouseEvent.CLICK,this.§_-I28§);
         this.§_-al§.addEventListener(MouseEvent.MOUSE_OVER,this.§_-W2O§);
         this.§_-71r§.addChild(this.§_-al§);
         new §_-Hb§(this.§_-al§,gls("Новости"));
         NotificationManager.instance.§_-P2Y§(NotificationManager.§_-K12§,new §_-E8§(this.§_-al§,10,10));
         this.§_-W1m§ = new §_-F1F§(new ButtonHeaderRating());
         this.§_-W1m§.y = 40;
         this.§_-W1m§.addEventListener(MouseEvent.CLICK,this.§_-6c§);
         this.§_-W1m§.addEventListener(MouseEvent.MOUSE_OVER,this.§_-T2e§);
         this.§_-71r§.addChild(this.§_-W1m§);
         new §_-Hb§(this.§_-W1m§,gls("Рейтинги"));
         this.group = new §_-G2L§();
         this.group.insert(this.§_-t1Q§);
         this.group.insert(this.§_-e1n§);
         this.group.insert(this.§_-W1m§);
         this.group.§_-32c§(this.§_-t1Q§);
         this.§_-71r§.addChild(this.group);
         this.§_-I7§ = new §_-31V§();
         this.§_-I7§.hide();
         this.§_-71r§.addChildAt(this.§_-I7§,0);
         EventsManager.addEventListener(EventsManager.CHANGE,this.§_-j2q§);
         this.§_-D2K§();
      }
      
      private function §_-T2e§(param1:MouseEvent) : void
      {
         GameSounds.play("reiting",true);
      }
      
      private function §_-W2O§(param1:MouseEvent) : void
      {
         GameSounds.play("paper",true);
      }
      
      private function §_-51n§(param1:MouseEvent) : void
      {
         GameSounds.play("icon_shop_1",true);
      }
      
      private function §_-s1j§(param1:MouseEvent) : void
      {
         GameSounds.play("main_screen",true);
      }
      
      private function §_-p2E§(param1:MouseEvent) : void
      {
         GameSounds.play("nutty_pass",true);
      }
      
      private function update() : void
      {
         if(Game.self == null)
         {
            return;
         }
         this.§_-fl§.§_-031§(Game.self);
      }
      
      private function §_-j2q§(param1:Event) : void
      {
         if(!this.§_-r2f§ || Boolean(§_-K1X§.§_-e1K§(§_-K1X§.§_-T1I§)))
         {
            return;
         }
         this.§_-71r§.removeChild(this.§_-r2f§);
         this.§_-r2f§ = null;
         this.§_-D2K§();
      }
      
      private function §_-i0§(param1:MouseEvent) : void
      {
         NuttyPassManager.§_-U2§();
      }
      
      private function §_-S1z§(param1:MouseEvent) : void
      {
         §_-71o§.show("Location");
      }
      
      private function §_-6H§(param1:MouseEvent) : void
      {
         §_-5B§.§_-R1G§(Game.selfId);
         §_-71o§.show(§_-5B§.instance);
      }
      
      private function §_-I28§(param1:MouseEvent = null) : void
      {
         GameSounds.play(§_-43Z§.§_-o1e§,true);
         §_-9f§.show(true);
      }
      
      private function §_-r1S§(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         GameSounds.play(§_-43Z§.§_-o1e§,true);
         §_-EI§.load(function():void
         {
            §_-m1L§.instance.show();
         });
      }
      
      private function §_-6c§(param1:MouseEvent) : void
      {
         §_-71o§.show(§_-J2n§.instance);
      }
      
      private function §_-yM§(param1:MouseEvent) : void
      {
         GameSounds.play("hous",true);
         if(§_-71o§.active is §_-5K§ || §_-71o§.active is §_-5B§ || §_-71o§.active is §_-F2y§ || §_-71o§.active is §_-ac§)
         {
            this.§_-I7§.show();
         }
      }
      
      private function §_-E2s§(param1:MouseEvent) : void
      {
         if(this.§_-I7§.visible)
         {
            this.§_-I7§.§_-t1G§();
         }
      }
      
      private function §_-C2D§(param1:ScreenEvent) : void
      {
         if(param1.screen is §_-5K§)
         {
            this.group.§_-32c§(this.§_-t1Q§);
         }
         else if(param1.screen is §_-J2n§)
         {
            this.group.§_-32c§(this.§_-W1m§);
         }
         else if(param1.screen is §_-5B§)
         {
            this.group.§_-32c§(this.§_-e1n§);
         }
         §_-Q1v§(param1.screen is §_-5B§);
      }
   }
}


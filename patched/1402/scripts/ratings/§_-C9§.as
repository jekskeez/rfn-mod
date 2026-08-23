package ratings
{
   import §_-X1k§.§_-82O§;
   import §_-c2C§.§_-j2f§;
   import §_-c2C§.§_-t2c§;
   import buttons.§_-K2G§;
   import events.GameEvent;
   import flash.display.GradientType;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.geom.Matrix;
   import flash.text.TextFormat;
   import utils.§_-B1d§;
   import utils.§_-cx§;
   
   public class §_-C9§ extends §_-qg§
   {
      
      private static const §_-v1t§:int = 15;
      
      private static const §_-Qg§:int = 8;
      
      protected static const §_-E19§:GlowFilter = new GlowFilter(1659998,1,4,4,16);
      
      protected static const §_-W2P§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,20,16777215);
      
      protected var §_-L1t§:§_-i5§ = null;
      
      protected var §_-j0§:§_-K2G§ = null;
      
      protected var §_-cL§:§_-K2G§ = null;
      
      private var §_-N6§:int = 8;
      
      public function §_-C9§(param1:int)
      {
         super(param1);
      }
      
      override protected function §_-83y§() : void
      {
         super.§_-83y§();
         this.§_-j0§ = new §_-K2G§(gls("Пригласить друзей"));
         this.§_-j0§.x = 98 - int(this.§_-j0§.width * 0.5);
         this.§_-j0§.y = 60;
         this.§_-j0§.addEventListener(MouseEvent.CLICK,Game.inviteFriends);
         this.§_-l1v§.addChild(this.§_-j0§);
         this.§_-o2P§.x = 450 - this.§_-o2P§.width - 5;
         this.§_-cL§ = new §_-K2G§(gls("Показать больше"));
         this.§_-cL§.x = 455;
         this.§_-cL§.y = this.§_-o2P§.y;
         this.§_-cL§.addEventListener(MouseEvent.CLICK,this.§_-O18§);
         addChild(this.§_-cL§);
      }
      
      override protected function get imageClass() : Class
      {
         return RatingImageNoFriend;
      }
      
      override protected function get imageText() : String
      {
         return gls("У тебя нет друзей-белок,\nс которыми можно было\nбы состязаться.\n\nЗнакомься, общайся и\nприглашай в игру!\nС друзьями всегда\nвеселей!");
      }
      
      override protected function §_-g22§() : void
      {
         var _loc1_:Matrix = new Matrix();
         _loc1_.createGradientBox(900,535,Math.PI * 0.5,0,0);
         this.graphics.beginGradientFill(GradientType.LINEAR,[14535087,16777215,14535087],[0.5,0.1,0.5],[0,100,255],_loc1_);
         this.graphics.drawRect(0,0,900,535);
      }
      
      override protected function §_-m1c§() : void
      {
         this.§_-W18§.x = 25;
         this.§_-W18§.y = 40;
         this.§_-W18§.setSize(860,450);
         this.§_-W18§.graphics.beginFill(0,0.05);
         this.§_-W18§.graphics.drawRect(-2,-2,844,454);
      }
      
      override protected function §_-Z1r§() : void
      {
         var _loc1_:LeagueFriendTapeView = new LeagueFriendTapeView();
         _loc1_.x = int((§_-Zy§.§_-21V§ - _loc1_.width) * 0.5);
         _loc1_.y = 5;
         addChild(_loc1_);
         var _loc2_:§_-i5§ = new §_-i5§(gls("Сезон закончится через:"),0,10,new TextFormat(null,14,542545,true));
         _loc2_.x = 445 - _loc2_.textWidth;
         addChild(_loc2_);
         this.§_-L1t§ = new §_-i5§("",455,6,§_-W2P§);
         this.§_-L1t§.filters = [§_-E19§];
         addChild(this.§_-L1t§);
      }
      
      override protected function §_-ZU§() : void
      {
         super.§_-ZU§();
         this.§_-cL§.visible = this.elements.length != 0;
      }
      
      override protected function listen() : void
      {
         Game.§_-53O§(GameEvent.ADD_FRIEND,this.§_-43§);
         Game.§_-53O§(GameEvent.REMOVE_FRIEND,this.§_-xM§);
      }
      
      override protected function §_-T2p§(param1:GameEvent) : void
      {
      }
      
      override protected function §_-r2B§() : void
      {
      }
      
      override protected function get ids() : Array
      {
         if(Game.§_-82§.length == 0)
         {
            return [];
         }
         var _loc1_:Array = §_-cx§.§_-y1Z§(Game.§_-82§);
         _loc1_ = _loc1_.slice(0,this.§_-N6§);
         _loc1_.push(Game.selfId);
         return _loc1_;
      }
      
      override protected function get timeUpdate() : int
      {
         return §_-v1t§;
      }
      
      override protected function §_-SR§(param1:int) : §_-u2r§
      {
         var _loc2_:§_-u2r§ = new §_-D1C§(this.type,param1);
         _loc2_.addEventListener(§_-u2r§.VALUE_CHANGE,§_-y2Z§);
         return _loc2_;
      }
      
      override protected function §_-62z§() : void
      {
         if(§_-t2c§.active is §_-j2f§)
         {
            super.§_-62z§();
         }
         this.§_-L1t§.text = §_-B1d§.§_-g2n§(§_-82O§.§_-C1R§);
      }
      
      private function §_-O18§(param1:MouseEvent) : void
      {
         this.§_-N6§ += §_-Qg§;
         this.§_-cL§.enabled = this.§_-N6§ < §_-cx§.§_-y1Z§(Game.§_-82§).length;
         §_-w16§(new GameEvent(GameEvent.DIVISION_CHANGED,{"type":this.type}));
      }
      
      private function §_-xM§(param1:GameEvent) : void
      {
         §_-w16§(new GameEvent(GameEvent.DIVISION_CHANGED,{
            "type":this.type,
            "reason":§_-82O§.§_-M15§,
            "delta":param1.data["value"]
         }));
      }
      
      private function §_-43§(param1:GameEvent) : void
      {
         §_-w16§(new GameEvent(GameEvent.DIVISION_CHANGED,{
            "type":this.type,
            "reason":§_-82O§.§_-TH§,
            "delta":param1.data["value"]
         }));
      }
   }
}


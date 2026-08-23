package ratings
{
   import §_-I10§.§_-13r§;
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-J2n§;
   import buttons.§_-j18§;
   import events.GameEvent;
   import flash.display.GradientType;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.geom.Matrix;
   import flash.text.TextFormat;
   import utils.§_-ex§;
   import utils.§_-qF§;
   
   public class §_-63f§ extends §_-t2m§
   {
      
      private static const §_-gb§:int = 15;
      
      private static const §_-B2Y§:int = 8;
      
      protected static const §_-Kw§:GlowFilter = new GlowFilter(1659998,1,4,4,16);
      
      protected static const §_-i2c§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,20,16777215);
      
      protected var §_-o2E§:§_-22V§ = null;
      
      protected var §_-32V§:§_-j18§ = null;
      
      protected var §_-Ps§:§_-j18§ = null;
      
      private var §_-g2N§:int = 8;
      
      public function §_-63f§(param1:int)
      {
         super(param1);
      }
      
      override protected function §_-q2u§() : void
      {
         super.§_-q2u§();
         this.§_-32V§ = new §_-j18§(gls("Пригласить друзей"));
         this.§_-32V§.x = 98 - int(this.§_-32V§.width * 0.5);
         this.§_-32V§.y = 60;
         this.§_-32V§.addEventListener(MouseEvent.CLICK,Game.inviteFriends);
         this.§_-31E§.addChild(this.§_-32V§);
         this.§_-S2T§.x = 450 - this.§_-S2T§.width - 5;
         this.§_-Ps§ = new §_-j18§(gls("Показать больше"));
         this.§_-Ps§.x = 455;
         this.§_-Ps§.y = this.§_-S2T§.y;
         this.§_-Ps§.addEventListener(MouseEvent.CLICK,this.§_-O15§);
         addChild(this.§_-Ps§);
      }
      
      override protected function get imageClass() : Class
      {
         return RatingImageNoFriend;
      }
      
      override protected function get imageText() : String
      {
         return gls("У тебя нет друзей-белок,\nс которыми можно было\nбы состязаться.\n\nЗнакомься, общайся и\nприглашай в игру!\nС друзьями всегда\nвеселей!");
      }
      
      override protected function §_-s2A§() : void
      {
         var _loc1_:Matrix = new Matrix();
         _loc1_.createGradientBox(900,535,Math.PI * 0.5,0,0);
         this.graphics.beginGradientFill(GradientType.LINEAR,[14535087,16777215,14535087],[0.5,0.1,0.5],[0,100,255],_loc1_);
         this.graphics.drawRect(0,0,900,535);
      }
      
      override protected function §_-V1H§() : void
      {
         this.§_-M1N§.x = 25;
         this.§_-M1N§.y = 40;
         this.§_-M1N§.setSize(860,450);
         this.§_-M1N§.graphics.beginFill(0,0.05);
         this.§_-M1N§.graphics.drawRect(-2,-2,844,454);
      }
      
      override protected function §_-036§() : void
      {
         var _loc1_:LeagueFriendTapeView = new LeagueFriendTapeView();
         _loc1_.x = int((§_-a9§.§_-9o§ - _loc1_.width) * 0.5);
         _loc1_.y = 5;
         addChild(_loc1_);
         var _loc2_:§_-22V§ = new §_-22V§(gls("Сезон закончится через:"),0,10,new TextFormat(null,14,542545,true));
         _loc2_.x = 445 - _loc2_.textWidth;
         addChild(_loc2_);
         this.§_-o2E§ = new §_-22V§("",455,6,§_-i2c§);
         this.§_-o2E§.filters = [§_-Kw§];
         addChild(this.§_-o2E§);
      }
      
      override protected function §_-l13§() : void
      {
         super.§_-l13§();
         this.§_-Ps§.visible = this.elements.length != 0;
      }
      
      override protected function listen() : void
      {
         Game.§_-Y2s§(GameEvent.ADD_FRIEND,this.§_-R1Z§);
         Game.§_-Y2s§(GameEvent.REMOVE_FRIEND,this.§_-l1y§);
      }
      
      override protected function §_-21H§(param1:GameEvent) : void
      {
      }
      
      override protected function §_-y2i§() : void
      {
      }
      
      override protected function get ids() : Array
      {
         if(Game.§_-t1u§.length == 0)
         {
            return [];
         }
         var _loc1_:Array = §_-qF§.§_-yi§(Game.§_-t1u§);
         _loc1_ = _loc1_.slice(0,this.§_-g2N§);
         _loc1_.push(Game.selfId);
         return _loc1_;
      }
      
      override protected function get timeUpdate() : int
      {
         return §_-gb§;
      }
      
      override protected function §_-F13§(param1:int) : §_-f1T§
      {
         var _loc2_:§_-f1T§ = new §_-l1x§(this.type,param1);
         _loc2_.addEventListener(§_-f1T§.VALUE_CHANGE,§_-q2K§);
         return _loc2_;
      }
      
      override protected function §_-A1b§() : void
      {
         if(§_-71o§.active is §_-J2n§)
         {
            super.§_-A1b§();
         }
         this.§_-o2E§.text = §_-ex§.§_-d2X§(§_-13r§.§_-c1h§);
      }
      
      private function §_-O15§(param1:MouseEvent) : void
      {
         this.§_-g2N§ += §_-B2Y§;
         this.§_-Ps§.enabled = this.§_-g2N§ < §_-qF§.§_-yi§(Game.§_-t1u§).length;
         §_-vM§(new GameEvent(GameEvent.DIVISION_CHANGED,{"type":this.type}));
      }
      
      private function §_-l1y§(param1:GameEvent) : void
      {
         §_-vM§(new GameEvent(GameEvent.DIVISION_CHANGED,{
            "type":this.type,
            "reason":§_-13r§.§_-n1x§,
            "delta":param1.data["value"]
         }));
      }
      
      private function §_-R1Z§(param1:GameEvent) : void
      {
         §_-vM§(new GameEvent(GameEvent.DIVISION_CHANGED,{
            "type":this.type,
            "reason":§_-13r§.§_-O2n§,
            "delta":param1.data["value"]
         }));
      }
   }
}


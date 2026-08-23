package §_-z2V§
{
   import §_-Qy§.§_-RT§;
   import §_-X1k§.§_-L1o§;
   import §_-X1k§.§_-P2x§;
   import events.GameEvent;
   import flash.text.TextFormat;
   import tape.§_-2n§;
   import views.§_-Y2D§;
   
   public class §_-B1H§ extends §_-2n§
   {
      
      private static const §_-B1t§:int = 95;
      
      private static const §_-u1l§:int = 100;
      
      private static const §_-W2P§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,10,6697728,true,null,null,null,null,"center");
      
      protected var icon:§_-Y2D§;
      
      protected var §_-q1l§:§_-RT§ = null;
      
      protected var §_-Sk§:Boolean = false;
      
      public function §_-B1H§(param1:int)
      {
         super(param1);
         §_-L1o§.addEventListener(GameEvent.CLOTHES_STORAGE_CHANGE,this.§_-qp§);
         §_-L1o§.addEventListener(GameEvent.CLOTHES_HERO_CHANGE,this.§_-qp§);
      }
      
      public function set §_-d2n§(param1:Boolean) : void
      {
         if(this.§_-Sk§ == param1)
         {
            return;
         }
         this.§_-Sk§ = param1;
         if(!this.§_-q1l§)
         {
            return;
         }
         if(!param1)
         {
            addChild(this.§_-q1l§);
         }
         else if(contains(this.§_-q1l§))
         {
            removeChild(this.§_-q1l§);
         }
      }
      
      public function get §_-d2n§() : Boolean
      {
         return this.§_-Sk§;
      }
      
      override protected function init() : void
      {
         super.init();
         this.§_-Oh§ = new ElementPackageBackSelectedGreen();
         this.§_-Oh§.width = §_-B1t§;
         this.§_-Oh§.height = §_-u1l§;
         this.§_-Oh§.visible = false;
         addChild(this.§_-Oh§);
         this.back = new ElementPackageBack();
         this.back.width = §_-B1t§;
         this.back.height = §_-u1l§;
         addChild(this.back);
         this.icon = new §_-Y2D§(this.§_-nb§);
         this.icon.scaleX = this.icon.scaleY = 0.3;
         this.icon.x = (§_-B1t§ - this.icon.width) * 0.5;
         this.icon.y = §_-u1l§ - this.icon.height - 12;
         addChild(this.icon);
         var _loc1_:§_-i5§ = new §_-i5§(§_-P2x§.§_-01H§(this.§_-nb§),0,3,§_-W2P§);
         _loc1_.width = §_-B1t§;
         _loc1_.wordWrap = true;
         addChild(_loc1_);
         this.§_-qp§();
      }
      
      protected function get §_-nb§() : int
      {
         if(§_-P2x§.§_-Q1Y§(this.id))
         {
            return this.id;
         }
         return §_-P2x§.§_-y18§(this.id)[0];
      }
      
      private function §_-qp§(param1:GameEvent = null) : void
      {
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         if(§_-P2x§.§_-Q1Y§(this.id))
         {
            _loc2_ = §_-L1o§.§_-WM§(§_-P2x§.§_-g1g§(this.id)) == -1;
         }
         else
         {
            _loc4_ = §_-P2x§.§_-y18§(this.id);
            _loc5_ = 0;
            while(_loc5_ < _loc4_.length)
            {
               _loc2_ ||= §_-L1o§.§_-O1P§(_loc4_[_loc5_]);
               _loc5_++;
            }
            _loc3_ = !§_-L1o§.§_-02s§(this.§_-nb§);
         }
         if(this.§_-q1l§)
         {
            this.§_-q1l§.visible = _loc3_ || _loc2_;
            this.§_-q1l§.type = _loc3_ ? §_-RT§.§_-81T§ : §_-RT§.§_-11J§;
         }
         else
         {
            if(!_loc3_ && !_loc2_)
            {
               return;
            }
            this.§_-q1l§ = new §_-RT§(_loc3_ ? §_-RT§.§_-81T§ : §_-RT§.§_-11J§);
            this.§_-q1l§.scaleX = this.§_-q1l§.scaleY = 0.75;
            this.§_-q1l§.x = 7;
            this.§_-q1l§.y = 87;
            if(!this.§_-d2n§)
            {
               addChild(this.§_-q1l§);
            }
         }
      }
   }
}


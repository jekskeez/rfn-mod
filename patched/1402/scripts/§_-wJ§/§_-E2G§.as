package §_-wJ§
{
   import §_-O2Y§.§_-jD§;
   import §_-X1k§.§_-42H§;
   import §_-X1k§.§_-L1o§;
   import §_-X1k§.§_-P2x§;
   import buttons.§_-uH§;
   import flash.text.TextFormat;
   import utils.§_-y1l§;
   import views.§_-Y2D§;
   
   public class §_-E2G§ extends §_-uH§
   {
      
      private static const §_-B1t§:int = 210;
      
      private static const §_-u1l§:int = 280;
      
      private static const §_-W2U§:TextFormat = new TextFormat(§_-i5§.§_-c10§,15,6697728,true,null,null,null,null,"center");
      
      public var elementId:int;
      
      private var §_-32P§:Boolean = false;
      
      private var icon:§_-Y2D§ = null;
      
      private var §_-E2K§:Array;
      
      private var §_-nb§:int;
      
      public function §_-E2G§(param1:int)
      {
         var _loc5_:§_-jD§ = null;
         this.§_-E2K§ = [];
         super(new ElementPackageBack(),new ElementPackageBackSelected(),new ElementPackageBackSelected());
         this.elementId = param1;
         this.§_-nb§ = §_-42H§.§_-Z1a§(this.elementId);
         var _loc2_:§_-i5§ = new §_-i5§(§_-P2x§.§_-01H§(this.§_-nb§),0,5,§_-W2U§,§_-B1t§ - 10);
         _loc2_.wordWrap = true;
         addChild(_loc2_);
         var _loc3_:Array = this.§_-w2h§();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc5_ = new §_-jD§(_loc3_[_loc4_]);
            _loc5_.width = _loc5_.height = 28;
            _loc5_.x = 188 - _loc5_.width * _loc4_;
            _loc5_.y = 19;
            _loc5_.filters = §_-y1l§.§_-Tk§;
            this.§_-E2K§.push(_loc5_);
            addChild(_loc5_);
            _loc4_++;
         }
         this.icon = new §_-Y2D§(this.§_-nb§);
         this.icon.scaleX = this.icon.scaleY = 0.65;
         this.icon.x = (§_-B1t§ - this.icon.width) * 0.5 - 3;
         this.icon.y = (§_-u1l§ - this.icon.height) * 0.5;
         addChild(this.icon);
         this.§_-32P§ = true;
         this.§_-Z2s§ = false;
      }
      
      public function update(param1:Boolean) : void
      {
         this.§_-Z2s§ = param1;
      }
      
      public function get §_-91c§() : Boolean
      {
         switch(§_-P2x§.§_-VD§(this.§_-nb§))
         {
            case §_-P2x§.§_-C1d§:
               if(!§_-L1o§.§_-2g§)
               {
                  return false;
               }
               break;
            case §_-P2x§.§_-9f§:
               if(!§_-L1o§.§_-UU§)
               {
                  return false;
               }
         }
         return true;
      }
      
      public function get §_-Z2s§() : Boolean
      {
         return this.§_-32P§;
      }
      
      public function set §_-Z2s§(param1:Boolean) : void
      {
         var _loc2_:§_-jD§ = null;
         if(!this.§_-91c§ || this.§_-32P§ == param1)
         {
            return;
         }
         this.§_-32P§ = param1;
         this.icon.filters = this.§_-32P§ ? [] : §_-y1l§.§_-Tk§;
         for each(_loc2_ in this.§_-E2K§)
         {
            _loc2_.filters = this.§_-32P§ ? [] : §_-y1l§.§_-Tk§;
         }
      }
      
      private function §_-w2h§() : Array
      {
         var _loc6_:int = 0;
         var _loc8_:int = 0;
         var _loc1_:Array = §_-P2x§.§_-G1S§(this.§_-nb§);
         var _loc2_:int = §_-P2x§.§_-VD§(this.§_-nb§);
         var _loc3_:int = -1;
         if(_loc2_ == §_-P2x§.§_-C1d§)
         {
            _loc3_ = §_-P2x§.§_-rR§;
         }
         else
         {
            if(_loc2_ != §_-P2x§.§_-9f§)
            {
               return _loc1_;
            }
            _loc3_ = §_-P2x§.§_-b2N§;
         }
         var _loc4_:Array = §_-P2x§.§_-G1S§(_loc3_);
         var _loc5_:Boolean = false;
         for each(_loc6_ in _loc1_)
         {
            if(_loc4_.indexOf(_loc6_) == -1)
            {
               _loc5_ = true;
               break;
            }
         }
         if(!_loc5_)
         {
            return _loc1_;
         }
         var _loc7_:Array = [];
         for each(_loc8_ in _loc1_)
         {
            if(_loc4_.indexOf(_loc8_) == -1)
            {
               _loc7_.push(_loc8_);
            }
         }
         return _loc7_;
      }
   }
}


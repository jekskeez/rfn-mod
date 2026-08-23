package §_-r16§
{
   import §_-I10§.§_-g2W§;
   import §_-I10§.§_-h1f§;
   import §_-I10§.§_-vy§;
   import §_-l2q§.§_-u1c§;
   import buttons.§_-F1F§;
   import flash.text.TextFormat;
   import utils.§_-x1Z§;
   import views.§_-W1y§;
   
   public class §_-p1e§ extends §_-F1F§
   {
      
      private static const §_-r2u§:int = 210;
      
      private static const §_-R1K§:int = 280;
      
      private static const §_-a1Y§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,15,6697728,true,null,null,null,null,"center");
      
      public var elementId:int;
      
      private var §_-OY§:Boolean = false;
      
      private var icon:§_-W1y§ = null;
      
      private var §_-o2G§:Array;
      
      private var §_-qW§:int;
      
      public function §_-p1e§(param1:int)
      {
         var _loc5_:§_-u1c§ = null;
         this.§_-o2G§ = [];
         super(new ElementPackageBack(),new ElementPackageBackSelected(),new ElementPackageBackSelected());
         this.elementId = param1;
         this.§_-qW§ = §_-vy§.§_-53T§(this.elementId);
         var _loc2_:§_-22V§ = new §_-22V§(§_-g2W§.§_-G1Y§(this.§_-qW§),0,5,§_-a1Y§,§_-r2u§ - 10);
         _loc2_.wordWrap = true;
         addChild(_loc2_);
         var _loc3_:Array = this.§_-11U§();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc5_ = new §_-u1c§(_loc3_[_loc4_]);
            _loc5_.width = _loc5_.height = 28;
            _loc5_.x = 188 - _loc5_.width * _loc4_;
            _loc5_.y = 19;
            _loc5_.filters = §_-x1Z§.§_-c2G§;
            this.§_-o2G§.push(_loc5_);
            addChild(_loc5_);
            _loc4_++;
         }
         this.icon = new §_-W1y§(this.§_-qW§);
         this.icon.scaleX = this.icon.scaleY = 0.65;
         this.icon.x = (§_-r2u§ - this.icon.width) * 0.5 - 3;
         this.icon.y = (§_-R1K§ - this.icon.height) * 0.5;
         addChild(this.icon);
         this.§_-OY§ = true;
         this.§_-Lu§ = false;
      }
      
      public function update(param1:Boolean) : void
      {
         this.§_-Lu§ = param1;
      }
      
      public function get §_-fv§() : Boolean
      {
         switch(§_-g2W§.§_-z1V§(this.§_-qW§))
         {
            case §_-g2W§.§_-x2F§:
               if(!§_-h1f§.§_-516§)
               {
                  return false;
               }
               break;
            case §_-g2W§.§_-k22§:
               if(!§_-h1f§.§_-q2X§)
               {
                  return false;
               }
         }
         return true;
      }
      
      public function get §_-Lu§() : Boolean
      {
         return this.§_-OY§;
      }
      
      public function set §_-Lu§(param1:Boolean) : void
      {
         var _loc2_:§_-u1c§ = null;
         if(!this.§_-fv§ || this.§_-OY§ == param1)
         {
            return;
         }
         this.§_-OY§ = param1;
         this.icon.filters = this.§_-OY§ ? [] : §_-x1Z§.§_-c2G§;
         for each(_loc2_ in this.§_-o2G§)
         {
            _loc2_.filters = this.§_-OY§ ? [] : §_-x1Z§.§_-c2G§;
         }
      }
      
      private function §_-11U§() : Array
      {
         var _loc6_:int = 0;
         var _loc8_:int = 0;
         var _loc1_:Array = §_-g2W§.§_-w2o§(this.§_-qW§);
         var _loc2_:int = §_-g2W§.§_-z1V§(this.§_-qW§);
         var _loc3_:int = -1;
         if(_loc2_ == §_-g2W§.§_-x2F§)
         {
            _loc3_ = §_-g2W§.§_-q1G§;
         }
         else
         {
            if(_loc2_ != §_-g2W§.§_-k22§)
            {
               return _loc1_;
            }
            _loc3_ = §_-g2W§.§_-qT§;
         }
         var _loc4_:Array = §_-g2W§.§_-w2o§(_loc3_);
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


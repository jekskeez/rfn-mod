package §_-us§
{
   import §_-AY§.§_-Su§;
   import dragonBones.§_-833§;
   import dragonBones.§_-83b§;
   
   public class ClothesHidingItem extends §_-M18§
   {
      
      public function ClothesHidingItem(param1:§_-Su§)
      {
         super(param1);
      }
      
      override public function §_-N1Z§(param1:§_-833§, param2:Boolean) : void
      {
         var _loc3_:String = null;
         var _loc4_:§_-83b§ = null;
         super.§_-N1Z§(param1,param2);
         §_-p2U§.add("ClothesHidingItem",this.params.hiddenBones);
         for each(_loc3_ in this.params.hiddenBones)
         {
            §_-p2U§.add("this.params.hiddenBones",_loc3_);
            _loc4_ = param1.§_-i2v§(_loc3_);
            if(_loc4_)
            {
               _loc4_.visible = false;
            }
         }
      }
      
      override public function §_-O2O§(param1:§_-833§) : void
      {
         var _loc2_:String = null;
         var _loc3_:§_-83b§ = null;
         for each(_loc2_ in this.params.hiddenBones)
         {
            _loc3_ = param1.§_-i2v§(_loc2_);
            if(_loc3_)
            {
               _loc3_.visible = true;
            }
         }
         super.§_-O2O§(param1);
      }
   }
}


package §_-2V§
{
   import §_-53U§.§_-M26§;
   import dragonBones.§_-E1r§;
   import dragonBones.§_-TH§;
   
   public class ClothesHidingItem extends §_-G1O§
   {
      
      public function ClothesHidingItem(param1:§_-M26§)
      {
         super(param1);
      }
      
      override public function §_-83Y§(param1:§_-E1r§, param2:Boolean) : void
      {
         var _loc3_:String = null;
         var _loc4_:§_-TH§ = null;
         super.§_-83Y§(param1,param2);
         §_-TQ§.add("ClothesHidingItem",this.params.hiddenBones);
         for each(_loc3_ in this.params.hiddenBones)
         {
            §_-TQ§.add("this.params.hiddenBones",_loc3_);
            _loc4_ = param1.§_-M1s§(_loc3_);
            if(_loc4_)
            {
               _loc4_.visible = false;
            }
         }
      }
      
      override public function §_-q2v§(param1:§_-E1r§) : void
      {
         var _loc2_:String = null;
         var _loc3_:§_-TH§ = null;
         for each(_loc2_ in this.params.hiddenBones)
         {
            _loc3_ = param1.§_-M1s§(_loc2_);
            if(_loc3_)
            {
               _loc3_.visible = true;
            }
         }
         super.§_-q2v§(param1);
      }
   }
}


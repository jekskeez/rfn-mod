package §_-53U§
{
   import §_-I10§.§_-h1f§;
   import §_-N14§.§_-w2t§;
   import dragonBones.§_-E1r§;
   
   public class §_-r1H§
   {
      
      private var view:Vector.<§_-M26§> = new Vector.<§_-M26§>();
      
      private var armature:§_-E1r§;
      
      private var §_-510§:Boolean = true;
      
      public function §_-r1H§(param1:§_-E1r§, param2:Boolean = true)
      {
         super();
         this.§_-510§ = param2;
         this.armature = param1;
      }
      
      public function remove() : void
      {
         this.clear();
         this.armature = null;
      }
      
      public function clear() : void
      {
         var _loc1_:* = int(this.view.length);
         while(_loc1_--)
         {
            this.§_-q2v§(_loc1_);
         }
         this.view = new Vector.<§_-M26§>();
      }
      
      public function §_-y2A§() : Array
      {
         var _loc1_:Array = [];
         var _loc2_:int = int(this.view.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_.push(this.view[_loc3_].params.id);
            _loc3_++;
         }
         return _loc1_;
      }
      
      public function §_-K26§(param1:Array, param2:Array = null) : void
      {
         var _loc4_:int = 0;
         var _loc5_:§_-M26§ = null;
         this.clear();
         if(param2 == null)
         {
            param2 = [];
         }
         var _loc3_:Array = §_-h1f§.§_-E13§(param1,param2);
         _loc4_ = int(_loc3_.length);
         if(!_loc4_)
         {
            return;
         }
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc5_ = ClothesFactory.create(_loc3_[_loc6_]);
            if(_loc5_)
            {
               _loc5_.§_-83Y§(this.armature,this.§_-510§);
               this.view.push(_loc5_);
            }
            _loc6_++;
         }
         this.armature.§_-V1S§();
         §_-w2t§.§_-R2J§.§_-ld§(§_-01Y§.delay);
      }
      
      private function §_-q2v§(param1:int) : void
      {
         if(param1 < 0)
         {
            return;
         }
         this.view[param1].§_-q2v§(this.armature);
         this.view.splice(param1,1);
         this.armature.§_-V1S§();
         §_-w2t§.§_-R2J§.§_-ld§(§_-01Y§.delay);
      }
   }
}


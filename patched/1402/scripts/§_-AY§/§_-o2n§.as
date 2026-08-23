package §_-AY§
{
   import §_-Vu§.§_-p4§;
   import §_-X1k§.§_-L1o§;
   import dragonBones.§_-833§;
   
   public class §_-o2n§
   {
      
      private var view:Vector.<§_-Su§> = new Vector.<§_-Su§>();
      
      private var armature:§_-833§;
      
      private var §_-t2t§:Boolean = true;
      
      public function §_-o2n§(param1:§_-833§, param2:Boolean = true)
      {
         super();
         this.§_-t2t§ = param2;
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
            this.§_-O2O§(_loc1_);
         }
         this.view = new Vector.<§_-Su§>();
      }
      
      public function §_-Th§() : Array
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
      
      public function §_-533§(param1:Array, param2:Array = null) : void
      {
         var _loc4_:int = 0;
         var _loc5_:§_-Su§ = null;
         this.clear();
         if(param2 == null)
         {
            param2 = [];
         }
         var _loc3_:Array = §_-L1o§.§_-R1e§(param1,param2);
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
               _loc5_.§_-N1Z§(this.armature,this.§_-t2t§);
               this.view.push(_loc5_);
            }
            _loc6_++;
         }
         this.armature.§_-j2c§();
         §_-p4§.§_-m1U§.§_-a1Q§(§_-p1V§.delay);
      }
      
      private function §_-O2O§(param1:int) : void
      {
         if(param1 < 0)
         {
            return;
         }
         this.view[param1].§_-O2O§(this.armature);
         this.view.splice(param1,1);
         this.armature.§_-j2c§();
         §_-p4§.§_-m1U§.§_-a1Q§(§_-p1V§.delay);
      }
   }
}


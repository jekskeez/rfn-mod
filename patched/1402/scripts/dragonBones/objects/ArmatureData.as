package dragonBones.objects
{
   public final class ArmatureData
   {
      
      public var name:String;
      
      private var §_-h2o§:Vector.<BoneData>;
      
      private var §_-vQ§:Vector.<SkinData>;
      
      private var §_-91R§:Vector.<AnimationData>;
      
      public function ArmatureData()
      {
         super();
         this.§_-h2o§ = new Vector.<BoneData>(0,true);
         this.§_-vQ§ = new Vector.<SkinData>(0,true);
         this.§_-91R§ = new Vector.<AnimationData>(0,true);
      }
      
      public function get §_-f1i§() : Vector.<BoneData>
      {
         return this.§_-h2o§;
      }
      
      public function get skinDataList() : Vector.<SkinData>
      {
         return this.§_-vQ§;
      }
      
      public function get §_-gi§() : Vector.<AnimationData>
      {
         return this.§_-91R§;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = int(this.§_-h2o§.length);
         while(_loc1_--)
         {
            this.§_-h2o§[_loc1_].dispose();
         }
         _loc1_ = int(this.§_-vQ§.length);
         while(_loc1_--)
         {
            this.§_-vQ§[_loc1_].dispose();
         }
         _loc1_ = int(this.§_-91R§.length);
         while(_loc1_--)
         {
            this.§_-91R§[_loc1_].dispose();
         }
         this.§_-h2o§.fixed = false;
         this.§_-h2o§.length = 0;
         this.§_-vQ§.fixed = false;
         this.§_-vQ§.length = 0;
         this.§_-91R§.fixed = false;
         this.§_-91R§.length = 0;
         this.§_-h2o§ = null;
         this.§_-vQ§ = null;
         this.§_-91R§ = null;
      }
      
      public function §_-2Z§(param1:String) : BoneData
      {
         var _loc2_:* = int(this.§_-h2o§.length);
         while(_loc2_--)
         {
            if(this.§_-h2o§[_loc2_].name == param1)
            {
               return this.§_-h2o§[_loc2_];
            }
         }
         return null;
      }
      
      public function §_-I1v§(param1:String) : SkinData
      {
         if(!param1)
         {
            return this.§_-vQ§[0];
         }
         var _loc2_:* = int(this.§_-vQ§.length);
         while(_loc2_--)
         {
            if(this.§_-vQ§[_loc2_].name == param1)
            {
               return this.§_-vQ§[_loc2_];
            }
         }
         return null;
      }
      
      public function §_-63g§(param1:String) : AnimationData
      {
         var _loc2_:* = int(this.§_-91R§.length);
         while(_loc2_--)
         {
            if(this.§_-91R§[_loc2_].name == param1)
            {
               return this.§_-91R§[_loc2_];
            }
         }
         return null;
      }
      
      public function addBoneData(param1:BoneData) : void
      {
         if(!param1)
         {
            throw new ArgumentError();
         }
         if(this.§_-h2o§.indexOf(param1) < 0)
         {
            this.§_-h2o§.fixed = false;
            this.§_-h2o§[this.§_-h2o§.length] = param1;
            this.§_-h2o§.fixed = true;
            return;
         }
         throw new ArgumentError();
      }
      
      public function addSkinData(param1:SkinData) : void
      {
         if(!param1)
         {
            throw new ArgumentError();
         }
         if(this.§_-vQ§.indexOf(param1) < 0)
         {
            this.§_-vQ§.fixed = false;
            this.§_-vQ§[this.§_-vQ§.length] = param1;
            this.§_-vQ§.fixed = true;
            return;
         }
         throw new ArgumentError();
      }
      
      public function §_-K28§(param1:AnimationData) : void
      {
         if(!param1)
         {
            throw new ArgumentError();
         }
         if(this.§_-91R§.indexOf(param1) < 0)
         {
            this.§_-91R§.fixed = false;
            this.§_-91R§[this.§_-91R§.length] = param1;
            this.§_-91R§.fixed = true;
         }
      }
      
      public function sortBoneDataList() : void
      {
         var _loc3_:BoneData = null;
         var _loc4_:int = 0;
         var _loc5_:BoneData = null;
         var _loc1_:* = int(this.§_-h2o§.length);
         if(_loc1_ == 0)
         {
            return;
         }
         var _loc2_:Array = [];
         while(_loc1_--)
         {
            _loc3_ = this.§_-h2o§[_loc1_];
            _loc4_ = 0;
            _loc5_ = _loc3_;
            while(Boolean(_loc5_) && Boolean(_loc5_.parent))
            {
               _loc4_++;
               _loc5_ = this.§_-2Z§(_loc5_.parent);
            }
            _loc2_[_loc1_] = {
               "level":_loc4_,
               "boneData":_loc3_
            };
         }
         _loc2_.sortOn("level",Array.NUMERIC);
         _loc1_ = int(_loc2_.length);
         while(_loc1_--)
         {
            this.§_-h2o§[_loc1_] = _loc2_[_loc1_].boneData;
         }
      }
   }
}


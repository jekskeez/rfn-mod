package dragonBones.objects
{
   public final class ArmatureData
   {
      
      public var name:String;
      
      private var §_-j1H§:Vector.<BoneData>;
      
      private var §_-028§:Vector.<SkinData>;
      
      private var §_-C33§:Vector.<AnimationData>;
      
      public function ArmatureData()
      {
         super();
         this.§_-j1H§ = new Vector.<BoneData>(0,true);
         this.§_-028§ = new Vector.<SkinData>(0,true);
         this.§_-C33§ = new Vector.<AnimationData>(0,true);
      }
      
      public function get §_-117§() : Vector.<BoneData>
      {
         return this.§_-j1H§;
      }
      
      public function get skinDataList() : Vector.<SkinData>
      {
         return this.§_-028§;
      }
      
      public function get §_-J2w§() : Vector.<AnimationData>
      {
         return this.§_-C33§;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = int(this.§_-j1H§.length);
         while(_loc1_--)
         {
            this.§_-j1H§[_loc1_].dispose();
         }
         _loc1_ = int(this.§_-028§.length);
         while(_loc1_--)
         {
            this.§_-028§[_loc1_].dispose();
         }
         _loc1_ = int(this.§_-C33§.length);
         while(_loc1_--)
         {
            this.§_-C33§[_loc1_].dispose();
         }
         this.§_-j1H§.fixed = false;
         this.§_-j1H§.length = 0;
         this.§_-028§.fixed = false;
         this.§_-028§.length = 0;
         this.§_-C33§.fixed = false;
         this.§_-C33§.length = 0;
         this.§_-j1H§ = null;
         this.§_-028§ = null;
         this.§_-C33§ = null;
      }
      
      public function §_-c2p§(param1:String) : BoneData
      {
         var _loc2_:* = int(this.§_-j1H§.length);
         while(_loc2_--)
         {
            if(this.§_-j1H§[_loc2_].name == param1)
            {
               return this.§_-j1H§[_loc2_];
            }
         }
         return null;
      }
      
      public function §_-d2p§(param1:String) : SkinData
      {
         if(!param1)
         {
            return this.§_-028§[0];
         }
         var _loc2_:* = int(this.§_-028§.length);
         while(_loc2_--)
         {
            if(this.§_-028§[_loc2_].name == param1)
            {
               return this.§_-028§[_loc2_];
            }
         }
         return null;
      }
      
      public function §_-v1g§(param1:String) : AnimationData
      {
         var _loc2_:* = int(this.§_-C33§.length);
         while(_loc2_--)
         {
            if(this.§_-C33§[_loc2_].name == param1)
            {
               return this.§_-C33§[_loc2_];
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
         if(this.§_-j1H§.indexOf(param1) < 0)
         {
            this.§_-j1H§.fixed = false;
            this.§_-j1H§[this.§_-j1H§.length] = param1;
            this.§_-j1H§.fixed = true;
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
         if(this.§_-028§.indexOf(param1) < 0)
         {
            this.§_-028§.fixed = false;
            this.§_-028§[this.§_-028§.length] = param1;
            this.§_-028§.fixed = true;
            return;
         }
         throw new ArgumentError();
      }
      
      public function §_-M19§(param1:AnimationData) : void
      {
         if(!param1)
         {
            throw new ArgumentError();
         }
         if(this.§_-C33§.indexOf(param1) < 0)
         {
            this.§_-C33§.fixed = false;
            this.§_-C33§[this.§_-C33§.length] = param1;
            this.§_-C33§.fixed = true;
         }
      }
      
      public function sortBoneDataList() : void
      {
         var _loc3_:BoneData = null;
         var _loc4_:int = 0;
         var _loc5_:BoneData = null;
         var _loc1_:* = int(this.§_-j1H§.length);
         if(_loc1_ == 0)
         {
            return;
         }
         var _loc2_:Array = [];
         while(_loc1_--)
         {
            _loc3_ = this.§_-j1H§[_loc1_];
            _loc4_ = 0;
            _loc5_ = _loc3_;
            while(Boolean(_loc5_) && Boolean(_loc5_.parent))
            {
               _loc4_++;
               _loc5_ = this.§_-c2p§(_loc5_.parent);
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
            this.§_-j1H§[_loc1_] = _loc2_[_loc1_].boneData;
         }
      }
   }
}


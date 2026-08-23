package dragonBones.objects
{
   import flash.geom.Point;
   
   public class SkeletonData
   {
      
      public var name:String;
      
      private var §_-M1p§:Object;
      
      private var §_-hs§:Vector.<ArmatureData>;
      
      public function SkeletonData()
      {
         super();
         this.§_-hs§ = new Vector.<ArmatureData>(0,true);
         this.§_-M1p§ = {};
      }
      
      public function get §_-83j§() : Vector.<String>
      {
         var _loc2_:ArmatureData = null;
         var _loc1_:Vector.<String> = new Vector.<String>();
         for each(_loc2_ in this.§_-hs§)
         {
            _loc1_[_loc1_.length] = _loc2_.name;
         }
         return _loc1_;
      }
      
      public function get §_-J1s§() : Vector.<ArmatureData>
      {
         return this.§_-hs§;
      }
      
      public function dispose() : void
      {
         var _loc1_:ArmatureData = null;
         for each(_loc1_ in this.§_-hs§)
         {
            _loc1_.dispose();
         }
         this.§_-hs§.fixed = false;
         this.§_-hs§.length = 0;
         this.§_-hs§ = null;
         this.§_-M1p§ = null;
      }
      
      public function §_-219§(param1:String) : ArmatureData
      {
         var _loc2_:* = int(this.§_-hs§.length);
         while(_loc2_--)
         {
            if(this.§_-hs§[_loc2_].name == param1)
            {
               return this.§_-hs§[_loc2_];
            }
         }
         return null;
      }
      
      public function §_-8b§(param1:ArmatureData) : void
      {
         if(!param1)
         {
            throw new ArgumentError();
         }
         if(this.§_-hs§.indexOf(param1) < 0)
         {
            this.§_-hs§.fixed = false;
            this.§_-hs§[this.§_-hs§.length] = param1;
            this.§_-hs§.fixed = true;
            return;
         }
         throw new ArgumentError();
      }
      
      public function §_-w2C§(param1:ArmatureData) : void
      {
         var _loc2_:int = this.§_-hs§.indexOf(param1);
         if(_loc2_ >= 0)
         {
            this.§_-hs§.fixed = false;
            this.§_-hs§.splice(_loc2_,1);
            this.§_-hs§.fixed = true;
         }
      }
      
      public function §_-P1I§(param1:String) : void
      {
         var _loc2_:* = int(this.§_-hs§.length);
         while(_loc2_--)
         {
            if(this.§_-hs§[_loc2_].name == param1)
            {
               this.§_-hs§.fixed = false;
               this.§_-hs§.splice(_loc2_,1);
               this.§_-hs§.fixed = true;
            }
         }
      }
      
      public function §_-S2L§(param1:String) : Point
      {
         return this.§_-M1p§[param1];
      }
      
      public function addSubTexturePivot(param1:Number, param2:Number, param3:String) : Point
      {
         var _loc4_:Point = this.§_-M1p§[param3];
         if(_loc4_)
         {
            _loc4_.x = param1;
            _loc4_.y = param2;
         }
         else
         {
            this.§_-M1p§[param3] = _loc4_ = new Point(param1,param2);
         }
         return _loc4_;
      }
      
      public function §_-hV§(param1:String) : void
      {
         if(param1)
         {
            delete this.§_-M1p§[param1];
         }
         else
         {
            for(param1 in this.§_-M1p§)
            {
               delete this.§_-M1p§[param1];
            }
         }
      }
   }
}


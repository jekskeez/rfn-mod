package dragonBones.objects
{
   import flash.geom.Point;
   
   public class SkeletonData
   {
      
      public var name:String;
      
      private var §_-Ka§:Object;
      
      private var §_-wK§:Vector.<ArmatureData>;
      
      public function SkeletonData()
      {
         super();
         this.§_-wK§ = new Vector.<ArmatureData>(0,true);
         this.§_-Ka§ = {};
      }
      
      public function get §_-wm§() : Vector.<String>
      {
         var _loc2_:ArmatureData = null;
         var _loc1_:Vector.<String> = new Vector.<String>();
         for each(_loc2_ in this.§_-wK§)
         {
            _loc1_[_loc1_.length] = _loc2_.name;
         }
         return _loc1_;
      }
      
      public function get §_-v1k§() : Vector.<ArmatureData>
      {
         return this.§_-wK§;
      }
      
      public function dispose() : void
      {
         var _loc1_:ArmatureData = null;
         for each(_loc1_ in this.§_-wK§)
         {
            _loc1_.dispose();
         }
         this.§_-wK§.fixed = false;
         this.§_-wK§.length = 0;
         this.§_-wK§ = null;
         this.§_-Ka§ = null;
      }
      
      public function §_-11w§(param1:String) : ArmatureData
      {
         var _loc2_:* = int(this.§_-wK§.length);
         while(_loc2_--)
         {
            if(this.§_-wK§[_loc2_].name == param1)
            {
               return this.§_-wK§[_loc2_];
            }
         }
         return null;
      }
      
      public function §_-Bf§(param1:ArmatureData) : void
      {
         if(!param1)
         {
            throw new ArgumentError();
         }
         if(this.§_-wK§.indexOf(param1) < 0)
         {
            this.§_-wK§.fixed = false;
            this.§_-wK§[this.§_-wK§.length] = param1;
            this.§_-wK§.fixed = true;
            return;
         }
         throw new ArgumentError();
      }
      
      public function §_-dE§(param1:ArmatureData) : void
      {
         var _loc2_:int = this.§_-wK§.indexOf(param1);
         if(_loc2_ >= 0)
         {
            this.§_-wK§.fixed = false;
            this.§_-wK§.splice(_loc2_,1);
            this.§_-wK§.fixed = true;
         }
      }
      
      public function §_-v1X§(param1:String) : void
      {
         var _loc2_:* = int(this.§_-wK§.length);
         while(_loc2_--)
         {
            if(this.§_-wK§[_loc2_].name == param1)
            {
               this.§_-wK§.fixed = false;
               this.§_-wK§.splice(_loc2_,1);
               this.§_-wK§.fixed = true;
            }
         }
      }
      
      public function §_-C3i§(param1:String) : Point
      {
         return this.§_-Ka§[param1];
      }
      
      public function addSubTexturePivot(param1:Number, param2:Number, param3:String) : Point
      {
         var _loc4_:Point = this.§_-Ka§[param3];
         if(_loc4_)
         {
            _loc4_.x = param1;
            _loc4_.y = param2;
         }
         else
         {
            this.§_-Ka§[param3] = _loc4_ = new Point(param1,param2);
         }
         return _loc4_;
      }
      
      public function §_-Wj§(param1:String) : void
      {
         if(param1)
         {
            delete this.§_-Ka§[param1];
         }
         else
         {
            for(param1 in this.§_-Ka§)
            {
               delete this.§_-Ka§[param1];
            }
         }
      }
   }
}


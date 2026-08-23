package dragonBones.objects
{
   public final class SlotData
   {
      
      public var name:String;
      
      public var parent:String;
      
      public var zOrder:Number;
      
      public var blendMode:String;
      
      private var §_-t2y§:Vector.<DisplayData>;
      
      public function SlotData()
      {
         super();
         this.§_-t2y§ = new Vector.<DisplayData>(0,true);
         this.zOrder = 0;
         this.blendMode = "normal";
      }
      
      public function get displayDataList() : Vector.<DisplayData>
      {
         return this.§_-t2y§;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = int(this.§_-t2y§.length);
         while(_loc1_--)
         {
            this.§_-t2y§[_loc1_].dispose();
         }
         this.§_-t2y§.fixed = false;
         this.§_-t2y§.length = 0;
         this.§_-t2y§ = null;
      }
      
      public function addDisplayData(param1:DisplayData) : void
      {
         if(!param1)
         {
            throw new ArgumentError();
         }
         if(this.§_-t2y§.indexOf(param1) < 0)
         {
            this.§_-t2y§.fixed = false;
            this.§_-t2y§[this.§_-t2y§.length] = param1;
            this.§_-t2y§.fixed = true;
            return;
         }
         throw new ArgumentError();
      }
      
      public function §_-X2w§(param1:String) : DisplayData
      {
         var _loc2_:* = int(this.§_-t2y§.length);
         while(_loc2_--)
         {
            if(this.§_-t2y§[_loc2_].name == param1)
            {
               return this.§_-t2y§[_loc2_];
            }
         }
         return null;
      }
   }
}


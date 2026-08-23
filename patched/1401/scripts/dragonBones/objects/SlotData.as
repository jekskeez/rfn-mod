package dragonBones.objects
{
   public final class SlotData
   {
      
      public var name:String;
      
      public var parent:String;
      
      public var zOrder:Number;
      
      public var blendMode:String;
      
      private var §_-m2n§:Vector.<DisplayData>;
      
      public function SlotData()
      {
         super();
         this.§_-m2n§ = new Vector.<DisplayData>(0,true);
         this.zOrder = 0;
         this.blendMode = "normal";
      }
      
      public function get displayDataList() : Vector.<DisplayData>
      {
         return this.§_-m2n§;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = int(this.§_-m2n§.length);
         while(_loc1_--)
         {
            this.§_-m2n§[_loc1_].dispose();
         }
         this.§_-m2n§.fixed = false;
         this.§_-m2n§.length = 0;
         this.§_-m2n§ = null;
      }
      
      public function addDisplayData(param1:DisplayData) : void
      {
         if(!param1)
         {
            throw new ArgumentError();
         }
         if(this.§_-m2n§.indexOf(param1) < 0)
         {
            this.§_-m2n§.fixed = false;
            this.§_-m2n§[this.§_-m2n§.length] = param1;
            this.§_-m2n§.fixed = true;
            return;
         }
         throw new ArgumentError();
      }
      
      public function §_-m2h§(param1:String) : DisplayData
      {
         var _loc2_:* = int(this.§_-m2n§.length);
         while(_loc2_--)
         {
            if(this.§_-m2n§[_loc2_].name == param1)
            {
               return this.§_-m2n§[_loc2_];
            }
         }
         return null;
      }
   }
}


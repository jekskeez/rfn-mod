package dragonBones.objects
{
   public final class SkinData
   {
      
      public var name:String;
      
      private var §_-m1A§:Vector.<SlotData>;
      
      public function SkinData()
      {
         super();
         this.§_-m1A§ = new Vector.<SlotData>(0,true);
      }
      
      public function get §_-525§() : Vector.<SlotData>
      {
         return this.§_-m1A§;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = int(this.§_-m1A§.length);
         while(_loc1_--)
         {
            this.§_-m1A§[_loc1_].dispose();
         }
         this.§_-m1A§.fixed = false;
         this.§_-m1A§.length = 0;
         this.§_-m1A§ = null;
      }
      
      public function getSlotData(param1:String) : SlotData
      {
         var _loc2_:* = int(this.§_-m1A§.length);
         while(_loc2_--)
         {
            if(this.§_-m1A§[_loc2_].name == param1)
            {
               return this.§_-m1A§[_loc2_];
            }
         }
         return null;
      }
      
      public function addSlotData(param1:SlotData) : void
      {
         if(!param1)
         {
            throw new ArgumentError();
         }
         if(this.§_-m1A§.indexOf(param1) < 0)
         {
            this.§_-m1A§.fixed = false;
            this.§_-m1A§[this.§_-m1A§.length] = param1;
            this.§_-m1A§.fixed = true;
            return;
         }
         throw new ArgumentError();
      }
   }
}


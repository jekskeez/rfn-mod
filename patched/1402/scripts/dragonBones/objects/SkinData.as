package dragonBones.objects
{
   public final class SkinData
   {
      
      public var name:String;
      
      private var §_-E1d§:Vector.<SlotData>;
      
      public function SkinData()
      {
         super();
         this.§_-E1d§ = new Vector.<SlotData>(0,true);
      }
      
      public function get §_-53R§() : Vector.<SlotData>
      {
         return this.§_-E1d§;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = int(this.§_-E1d§.length);
         while(_loc1_--)
         {
            this.§_-E1d§[_loc1_].dispose();
         }
         this.§_-E1d§.fixed = false;
         this.§_-E1d§.length = 0;
         this.§_-E1d§ = null;
      }
      
      public function getSlotData(param1:String) : SlotData
      {
         var _loc2_:* = int(this.§_-E1d§.length);
         while(_loc2_--)
         {
            if(this.§_-E1d§[_loc2_].name == param1)
            {
               return this.§_-E1d§[_loc2_];
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
         if(this.§_-E1d§.indexOf(param1) < 0)
         {
            this.§_-E1d§.fixed = false;
            this.§_-E1d§[this.§_-E1d§.length] = param1;
            this.§_-E1d§.fixed = true;
            return;
         }
         throw new ArgumentError();
      }
   }
}


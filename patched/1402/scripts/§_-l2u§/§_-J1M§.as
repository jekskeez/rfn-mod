package §_-l2u§
{
   import game.mainGame.GameMap;
   
   public class §_-J1M§
   {
      
      private static const §_-E1m§:int = 10;
      
      private var §_-x2U§:Array = [];
      
      private var position:int = -1;
      
      private var §_-63l§:Boolean = false;
      
      private var map:GameMap;
      
      public function §_-J1M§(param1:GameMap)
      {
         super();
         this.map = param1;
      }
      
      public function §_-a1r§(param1:GameMap) : void
      {
         this.map = param1;
      }
      
      public function get §_-03U§() : Boolean
      {
         return this.position > -1;
      }
      
      public function get §_-N29§() : Boolean
      {
         return this.position < this.§_-x2U§.length - 2;
      }
      
      public function §_-Vb§() : Boolean
      {
         var _loc1_:String = this.map.§_-m1Y§();
         if(_loc1_ == this.§_-x2U§[this.position])
         {
            return false;
         }
         if(this.§_-x2U§.length > §_-E1m§ - 1)
         {
            this.§_-x2U§ = this.§_-x2U§.slice(1,this.position + 1);
            --this.position;
         }
         if(this.§_-63l§)
         {
            this.§_-x2U§ = this.§_-x2U§.slice(0,this.position + 1);
         }
         this.§_-63l§ = false;
         ++this.position;
         this.§_-x2U§[this.position] = _loc1_;
         return true;
      }
      
      public function §_-A1x§() : Boolean
      {
         if(this.position <= -1)
         {
            return false;
         }
         this.§_-63l§ = true;
         if(this.position == this.§_-x2U§.length - 1)
         {
            this.§_-x2U§[this.position + 1] = this.map.§_-m1Y§();
         }
         --this.position;
         this.map.§_-o2I§(this.§_-x2U§[this.position + 1]);
         return true;
      }
      
      public function §_-r2i§() : Boolean
      {
         if(this.position >= this.§_-x2U§.length - 2)
         {
            return false;
         }
         ++this.position;
         this.map.§_-o2I§(this.§_-x2U§[this.position + 1]);
         return true;
      }
      
      public function clear() : void
      {
         this.§_-x2U§ = [];
         this.position = -1;
         this.§_-63l§ = false;
      }
   }
}


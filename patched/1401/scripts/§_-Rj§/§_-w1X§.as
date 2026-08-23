package §_-Rj§
{
   import game.mainGame.GameMap;
   
   public class §_-w1X§
   {
      
      private static const §_-12n§:int = 10;
      
      private var §_-gv§:Array = [];
      
      private var position:int = -1;
      
      private var §_-V2J§:Boolean = false;
      
      private var map:GameMap;
      
      public function §_-w1X§(param1:GameMap)
      {
         super();
         this.map = param1;
      }
      
      public function §_-t9§(param1:GameMap) : void
      {
         this.map = param1;
      }
      
      public function get §_-kM§() : Boolean
      {
         return this.position > -1;
      }
      
      public function get §_-3z§() : Boolean
      {
         return this.position < this.§_-gv§.length - 2;
      }
      
      public function §_-Wg§() : Boolean
      {
         var _loc1_:String = this.map.§_-A1X§();
         if(_loc1_ == this.§_-gv§[this.position])
         {
            return false;
         }
         if(this.§_-gv§.length > §_-12n§ - 1)
         {
            this.§_-gv§ = this.§_-gv§.slice(1,this.position + 1);
            --this.position;
         }
         if(this.§_-V2J§)
         {
            this.§_-gv§ = this.§_-gv§.slice(0,this.position + 1);
         }
         this.§_-V2J§ = false;
         ++this.position;
         this.§_-gv§[this.position] = _loc1_;
         return true;
      }
      
      public function §_-P2c§() : Boolean
      {
         if(this.position <= -1)
         {
            return false;
         }
         this.§_-V2J§ = true;
         if(this.position == this.§_-gv§.length - 1)
         {
            this.§_-gv§[this.position + 1] = this.map.§_-A1X§();
         }
         --this.position;
         this.map.§_-41M§(this.§_-gv§[this.position + 1]);
         return true;
      }
      
      public function §_-82E§() : Boolean
      {
         if(this.position >= this.§_-gv§.length - 2)
         {
            return false;
         }
         ++this.position;
         this.map.§_-41M§(this.§_-gv§[this.position + 1]);
         return true;
      }
      
      public function clear() : void
      {
         this.§_-gv§ = [];
         this.position = -1;
         this.§_-V2J§ = false;
      }
   }
}


package views
{
   import flash.display.Sprite;
   import flash.utils.getDefinitionByName;
   
   public class §_-Rj§ extends Sprite
   {
      
      public static const §_-m8§:Array = [RatingIconNone,RatingIconBronze,RatingIconSilver,RatingIconGold,RatingIconMaster,RatingIconDiamond,RatingIconChampion];
      
      private var §_-x1y§:int = -1;
      
      private var §_-a12§:Number = 1;
      
      private var §_-y1q§:Sprite = null;
      
      public function §_-Rj§(param1:int = -1, param2:Number = 1)
      {
         super();
         this.§_-a12§ = param2;
         if(param1 != -1)
         {
            this.league = param1;
         }
      }
      
      public function set league(param1:int) : void
      {
         if(this.§_-x1y§ == param1)
         {
            return;
         }
         this.§_-x1y§ = param1;
         if(this.§_-y1q§)
         {
            removeChild(this.§_-y1q§);
            this.§_-y1q§ = null;
         }
         this.§_-y1q§ = new §_-m8§[param1]();
         this.§_-y1q§.scaleX = this.§_-y1q§.scaleY = this.§_-a12§;
         addChild(this.§_-y1q§);
      }
      
      public function get league() : int
      {
         return this.§_-x1y§;
      }
      
      public function set scale(param1:Number) : void
      {
         if(this.§_-a12§ == param1)
         {
            return;
         }
         this.§_-a12§ = param1;
         if(this.§_-y1q§)
         {
            this.§_-y1q§.scaleX = this.§_-y1q§.scaleY = param1;
         }
      }
      
      public function get scale() : Number
      {
         return this.§_-a12§;
      }
      
      public function §_-C7§() : Sprite
      {
         return this.§_-y1q§;
      }
   }
}


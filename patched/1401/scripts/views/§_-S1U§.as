package views
{
   import flash.display.Sprite;
   import flash.utils.getDefinitionByName;
   
   public class §_-S1U§ extends Sprite
   {
      
      public static const §_-F7§:Array = [RatingIconNone,RatingIconBronze,RatingIconSilver,RatingIconGold,RatingIconMaster,RatingIconDiamond,RatingIconChampion];
      
      private var §_-z2s§:int = -1;
      
      private var §_-Tq§:Number = 1;
      
      private var §_-92e§:Sprite = null;
      
      public function §_-S1U§(param1:int = -1, param2:Number = 1)
      {
         super();
         this.§_-Tq§ = param2;
         if(param1 != -1)
         {
            this.league = param1;
         }
      }
      
      public function set league(param1:int) : void
      {
         if(this.§_-z2s§ == param1)
         {
            return;
         }
         this.§_-z2s§ = param1;
         if(this.§_-92e§)
         {
            removeChild(this.§_-92e§);
            this.§_-92e§ = null;
         }
         this.§_-92e§ = new §_-F7§[param1]();
         this.§_-92e§.scaleX = this.§_-92e§.scaleY = this.§_-Tq§;
         addChild(this.§_-92e§);
      }
      
      public function get league() : int
      {
         return this.§_-z2s§;
      }
      
      public function set scale(param1:Number) : void
      {
         if(this.§_-Tq§ == param1)
         {
            return;
         }
         this.§_-Tq§ = param1;
         if(this.§_-92e§)
         {
            this.§_-92e§.scaleX = this.§_-92e§.scaleY = param1;
         }
      }
      
      public function get scale() : Number
      {
         return this.§_-Tq§;
      }
      
      public function §_-U1K§() : Sprite
      {
         return this.§_-92e§;
      }
   }
}


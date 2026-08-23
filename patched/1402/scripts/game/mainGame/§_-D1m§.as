package game.mainGame
{
   import §_-TK§.§_-aS§;
   
   public class §_-D1m§ extends §_-aS§
   {
      
      public static const §_-E26§:int = 0;
      
      public static const §_-kY§:int = 1;
      
      public static const §_-o1U§:int = 2;
      
      public static const §_-f2D§:int = 3;
      
      public static const §_-s2n§:int = 4;
      
      public static const §_-S27§:int = 5;
      
      public static const §_-j10§:int = 6;
      
      public static const §_-Ir§:int = 0;
      
      public static const §_-A36§:int = 1;
      
      public static const §_-E1V§:int = 2;
      
      public static const §_-P1n§:int = 16;
      
      public static const §_-737§:int = 17;
      
      public static const §_-Q1O§:int = 3;
      
      public static const §_-qf§:int = 4;
      
      public static const §_-b2Z§:int = 5;
      
      public static const §_-E1n§:int = 6;
      
      public static const §_-h8§:int = 7;
      
      public static const §_-mw§:int = 8;
      
      public static const §_-82E§:int = 9;
      
      public static const §_-73O§:int = 10;
      
      public static const §_-xH§:int = 11;
      
      public static const §_-9R§:int = 12;
      
      public static const §_-h2z§:int = 13;
      
      public static const §_-qP§:int = 14;
      
      public static const §_-Cb§:int = 15;
      
      private var §_-T0§:int = -1;
      
      private var §_-o2F§:int = -1;
      
      private var §_-C3B§:§_-aS§;
      
      private var §_-y1q§:§_-aS§;
      
      public function §_-D1m§(param1:int = -1, param2:int = -1)
      {
         super();
         this.color = param1;
         this.icon = param2;
      }
      
      override public function set rotation(param1:Number) : void
      {
         super.rotation = param1;
         if(this.§_-y1q§)
         {
            this.§_-y1q§.rotation = -param1;
         }
      }
      
      public function get color() : int
      {
         return this.§_-T0§;
      }
      
      public function set color(param1:int) : void
      {
         if(this.§_-T0§ == param1)
         {
            return;
         }
         this.§_-T0§ = param1;
         if(this.§_-C3B§)
         {
            if(this.§_-y1q§)
            {
               this.§_-C3B§.removeChildStarling(this.§_-y1q§,false);
            }
            removeChildStarling(this.§_-C3B§);
         }
         switch(this.color)
         {
            case §_-E26§:
               this.§_-C3B§ = §_-J2J§(new §_-aS§(new YellowSideArrow()));
               break;
            case §_-kY§:
               this.§_-C3B§ = §_-J2J§(new §_-aS§(new BlueSideArrow()));
               break;
            case §_-o1U§:
               this.§_-C3B§ = §_-J2J§(new §_-aS§(new GreenSideArrow()));
               break;
            case §_-f2D§:
               this.§_-C3B§ = §_-J2J§(new §_-aS§(new RedSideArrow()));
               break;
            case §_-s2n§:
               this.§_-C3B§ = §_-J2J§(new §_-aS§(new PurpleSideArrow()));
               break;
            case §_-S27§:
               this.§_-C3B§ = §_-J2J§(new §_-aS§(new PinkSideArrow()));
               break;
            case §_-j10§:
               this.§_-C3B§ = §_-J2J§(new §_-aS§(new OrangeSideArrow()));
         }
         this.§_-D2l§();
      }
      
      public function get icon() : int
      {
         return this.§_-o2F§;
      }
      
      public function set icon(param1:int) : void
      {
         if(this.§_-o2F§ == param1)
         {
            this.§_-D2l§();
            return;
         }
         this.§_-o2F§ = param1;
         if(Boolean(this.§_-C3B§) && Boolean(this.§_-y1q§))
         {
            this.§_-C3B§.removeChildStarling(this.§_-y1q§);
         }
         switch(this.icon)
         {
            case §_-A36§:
               this.§_-y1q§ = new §_-aS§(new AcornSideIcon());
               break;
            case §_-Ir§:
               this.§_-y1q§ = new §_-aS§(new HollowSideIcon());
               break;
            case §_-E1V§:
               this.§_-y1q§ = new §_-aS§(new ShamanSideIcon());
               break;
            case §_-P1n§:
               this.§_-y1q§ = new §_-aS§(new RedShamanSideIcon());
               break;
            case §_-737§:
               this.§_-y1q§ = new §_-aS§(new BlackShamanSideIcon());
               break;
            case §_-Q1O§:
               this.§_-y1q§ = new §_-aS§(new SquirrelSideIcon());
               break;
            case §_-qf§:
               this.§_-y1q§ = new §_-aS§(new HareSideIcon());
               break;
            case §_-b2Z§:
               this.§_-y1q§ = new §_-aS§(new PoiseRespawnIcon());
               break;
            case §_-E1n§:
               this.§_-y1q§ = new §_-aS§(new SideCollectionIcon());
               break;
            case §_-h8§:
               this.§_-y1q§ = new §_-aS§(new DragonSideIcon());
               break;
            case §_-mw§:
               this.§_-y1q§ = new §_-aS§(new FountainSideIcon());
               break;
            case §_-82E§:
               this.§_-y1q§ = new §_-aS§(new CardSideIcon());
               break;
            case §_-73O§:
               this.§_-y1q§ = new §_-aS§(new CocktailSideIcon());
               break;
            case §_-xH§:
               this.§_-y1q§ = new §_-aS§(new GoldBugSideIcon());
               break;
            case §_-9R§:
               this.§_-y1q§ = new §_-aS§(new MedkitSideIcon());
               break;
            case §_-h2z§:
               this.§_-y1q§ = new §_-aS§(new SurpriseBoxSideIcon());
               break;
            case §_-qP§:
               this.§_-y1q§ = new §_-aS§(new VendigoSideIcon());
               break;
            case §_-Cb§:
               this.§_-y1q§ = new §_-aS§(new VictimSideIcon());
               break;
            default:
               this.§_-y1q§ = null;
         }
         this.§_-D2l§();
      }
      
      private function §_-D2l§() : void
      {
         if(!this.§_-y1q§ || !this.§_-C3B§)
         {
            return;
         }
         if(this.§_-C3B§.§_-U2E§(this.§_-y1q§))
         {
            return;
         }
         this.§_-C3B§.§_-J2J§(this.§_-y1q§);
         this.§_-y1q§.y = 22;
      }
   }
}


package game.mainGame
{
   import §_-RI§.§_-h2I§;
   
   public class §_-1s§ extends §_-h2I§
   {
      
      public static const §_-V2O§:int = 0;
      
      public static const §_-tC§:int = 1;
      
      public static const §_-I2j§:int = 2;
      
      public static const §_-32X§:int = 3;
      
      public static const §_-72m§:int = 4;
      
      public static const §_-F2F§:int = 5;
      
      public static const §_-B2C§:int = 6;
      
      public static const §_-vB§:int = 0;
      
      public static const §_-L29§:int = 1;
      
      public static const §_-SC§:int = 2;
      
      public static const §_-S1Q§:int = 16;
      
      public static const §_-WE§:int = 17;
      
      public static const §_-9Q§:int = 3;
      
      public static const §_-R1i§:int = 4;
      
      public static const §_-93g§:int = 5;
      
      public static const §_-b1P§:int = 6;
      
      public static const §_-C3E§:int = 7;
      
      public static const §_-b1s§:int = 8;
      
      public static const §_-wY§:int = 9;
      
      public static const §_-r1v§:int = 10;
      
      public static const §_-Bk§:int = 11;
      
      public static const §_-F2Y§:int = 12;
      
      public static const §_-e11§:int = 13;
      
      public static const §_-Ce§:int = 14;
      
      public static const §_-O2Z§:int = 15;
      
      private var §_-83K§:int = -1;
      
      private var §_-03t§:int = -1;
      
      private var §_-pA§:§_-h2I§;
      
      private var §_-92e§:§_-h2I§;
      
      public function §_-1s§(param1:int = -1, param2:int = -1)
      {
         super();
         this.color = param1;
         this.icon = param2;
      }
      
      override public function set rotation(param1:Number) : void
      {
         super.rotation = param1;
         if(this.§_-92e§)
         {
            this.§_-92e§.rotation = -param1;
         }
      }
      
      public function get color() : int
      {
         return this.§_-83K§;
      }
      
      public function set color(param1:int) : void
      {
         if(this.§_-83K§ == param1)
         {
            return;
         }
         this.§_-83K§ = param1;
         if(this.§_-pA§)
         {
            if(this.§_-92e§)
            {
               this.§_-pA§.removeChildStarling(this.§_-92e§,false);
            }
            removeChildStarling(this.§_-pA§);
         }
         switch(this.color)
         {
            case §_-V2O§:
               this.§_-pA§ = §_-83v§(new §_-h2I§(new YellowSideArrow()));
               break;
            case §_-tC§:
               this.§_-pA§ = §_-83v§(new §_-h2I§(new BlueSideArrow()));
               break;
            case §_-I2j§:
               this.§_-pA§ = §_-83v§(new §_-h2I§(new GreenSideArrow()));
               break;
            case §_-32X§:
               this.§_-pA§ = §_-83v§(new §_-h2I§(new RedSideArrow()));
               break;
            case §_-72m§:
               this.§_-pA§ = §_-83v§(new §_-h2I§(new PurpleSideArrow()));
               break;
            case §_-F2F§:
               this.§_-pA§ = §_-83v§(new §_-h2I§(new PinkSideArrow()));
               break;
            case §_-B2C§:
               this.§_-pA§ = §_-83v§(new §_-h2I§(new OrangeSideArrow()));
         }
         this.§_-Bv§();
      }
      
      public function get icon() : int
      {
         return this.§_-03t§;
      }
      
      public function set icon(param1:int) : void
      {
         if(this.§_-03t§ == param1)
         {
            this.§_-Bv§();
            return;
         }
         this.§_-03t§ = param1;
         if(Boolean(this.§_-pA§) && Boolean(this.§_-92e§))
         {
            this.§_-pA§.removeChildStarling(this.§_-92e§);
         }
         switch(this.icon)
         {
            case §_-L29§:
               this.§_-92e§ = new §_-h2I§(new AcornSideIcon());
               break;
            case §_-vB§:
               this.§_-92e§ = new §_-h2I§(new HollowSideIcon());
               break;
            case §_-SC§:
               this.§_-92e§ = new §_-h2I§(new ShamanSideIcon());
               break;
            case §_-S1Q§:
               this.§_-92e§ = new §_-h2I§(new RedShamanSideIcon());
               break;
            case §_-WE§:
               this.§_-92e§ = new §_-h2I§(new BlackShamanSideIcon());
               break;
            case §_-9Q§:
               this.§_-92e§ = new §_-h2I§(new SquirrelSideIcon());
               break;
            case §_-R1i§:
               this.§_-92e§ = new §_-h2I§(new HareSideIcon());
               break;
            case §_-93g§:
               this.§_-92e§ = new §_-h2I§(new PoiseRespawnIcon());
               break;
            case §_-b1P§:
               this.§_-92e§ = new §_-h2I§(new SideCollectionIcon());
               break;
            case §_-C3E§:
               this.§_-92e§ = new §_-h2I§(new DragonSideIcon());
               break;
            case §_-b1s§:
               this.§_-92e§ = new §_-h2I§(new FountainSideIcon());
               break;
            case §_-wY§:
               this.§_-92e§ = new §_-h2I§(new CardSideIcon());
               break;
            case §_-r1v§:
               this.§_-92e§ = new §_-h2I§(new CocktailSideIcon());
               break;
            case §_-Bk§:
               this.§_-92e§ = new §_-h2I§(new GoldBugSideIcon());
               break;
            case §_-F2Y§:
               this.§_-92e§ = new §_-h2I§(new MedkitSideIcon());
               break;
            case §_-e11§:
               this.§_-92e§ = new §_-h2I§(new SurpriseBoxSideIcon());
               break;
            case §_-Ce§:
               this.§_-92e§ = new §_-h2I§(new VendigoSideIcon());
               break;
            case §_-O2Z§:
               this.§_-92e§ = new §_-h2I§(new VictimSideIcon());
               break;
            default:
               this.§_-92e§ = null;
         }
         this.§_-Bv§();
      }
      
      private function §_-Bv§() : void
      {
         if(!this.§_-92e§ || !this.§_-pA§)
         {
            return;
         }
         if(this.§_-pA§.§_-ws§(this.§_-92e§))
         {
            return;
         }
         this.§_-pA§.§_-83v§(this.§_-92e§);
         this.§_-92e§.y = 22;
      }
   }
}


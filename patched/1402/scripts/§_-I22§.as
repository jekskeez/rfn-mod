package
{
   import §_-TK§.§_-aS§;
   import §_-TK§.§_-f1u§;
   import flash.utils.getDefinitionByName;
   import utils.§_-y4§;
   
   public class §_-I22§ extends §_-aS§ implements §_-y4§
   {
      
      private var §_-Q1i§:§_-f1u§;
      
      private var §_-e1S§:§_-f1u§;
      
      private var §_-D2k§:int = -2;
      
      public function §_-I22§(param1:Array)
      {
         super();
         var _loc2_:Class = getDefinitionByName(param1[0]) as Class;
         this.§_-Q1i§ = new §_-f1u§(new _loc2_());
         _loc2_ = getDefinitionByName(param1[1]) as Class;
         this.§_-e1S§ = new §_-f1u§(new _loc2_());
         §_-J2J§(this.§_-e1S§);
         §_-J2J§(this.§_-Q1i§);
         this.setState(Hero.§_-h1o§);
      }
      
      public function setState(param1:int, param2:int = 0) : void
      {
         if(this.§_-D2k§ == param1 && param1 == Hero.§_-72g§)
         {
            return;
         }
         this.§_-D2k§ = param1;
         if(this.§_-e1S§)
         {
            this.§_-e1S§.stop();
         }
         if(this.§_-Q1i§)
         {
            this.§_-Q1i§.stop();
         }
         if(param1 == Hero.§_-72g§)
         {
            return;
         }
         if(this.§_-e1S§)
         {
            this.§_-e1S§.visible = false;
         }
         if(this.§_-Q1i§)
         {
            this.§_-Q1i§.visible = false;
         }
         switch(this.§_-D2k§)
         {
            case Hero.§_-134§:
            case Hero.§_-h1o§:
               this.§_-e1S§.visible = true;
               this.§_-e1S§.gotoAndPlay(0);
               break;
            case Hero.§_-b1i§:
               this.§_-Q1i§.visible = true;
               this.§_-Q1i§.gotoAndPlay(0);
               break;
            case Hero.§_-l19§:
               this.§_-Q1i§.visible = true;
               this.§_-Q1i§.gotoAndStop(5);
         }
      }
   }
}


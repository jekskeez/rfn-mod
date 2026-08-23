package
{
   import §_-RI§.§_-d2d§;
   import §_-RI§.§_-h2I§;
   import flash.utils.getDefinitionByName;
   import utils.§_-Xc§;
   
   public class §_-b2V§ extends §_-h2I§ implements §_-Xc§
   {
      
      private var §_-72e§:§_-d2d§;
      
      private var §_-Dc§:§_-d2d§;
      
      private var §_-71n§:int = -2;
      
      public function §_-b2V§(param1:Array)
      {
         super();
         var _loc2_:Class = getDefinitionByName(param1[0]) as Class;
         this.§_-72e§ = new §_-d2d§(new _loc2_());
         _loc2_ = getDefinitionByName(param1[1]) as Class;
         this.§_-Dc§ = new §_-d2d§(new _loc2_());
         §_-83v§(this.§_-Dc§);
         §_-83v§(this.§_-72e§);
         this.setState(Hero.§_-T1p§);
      }
      
      public function setState(param1:int, param2:int = 0) : void
      {
         if(this.§_-71n§ == param1 && param1 == Hero.§_-1d§)
         {
            return;
         }
         this.§_-71n§ = param1;
         if(this.§_-Dc§)
         {
            this.§_-Dc§.stop();
         }
         if(this.§_-72e§)
         {
            this.§_-72e§.stop();
         }
         if(param1 == Hero.§_-1d§)
         {
            return;
         }
         if(this.§_-Dc§)
         {
            this.§_-Dc§.visible = false;
         }
         if(this.§_-72e§)
         {
            this.§_-72e§.visible = false;
         }
         switch(this.§_-71n§)
         {
            case Hero.§_-53A§:
            case Hero.§_-T1p§:
               this.§_-Dc§.visible = true;
               this.§_-Dc§.gotoAndPlay(0);
               break;
            case Hero.§_-w11§:
               this.§_-72e§.visible = true;
               this.§_-72e§.gotoAndPlay(0);
               break;
            case Hero.§_-ZP§:
               this.§_-72e§.visible = true;
               this.§_-72e§.gotoAndStop(5);
         }
      }
   }
}


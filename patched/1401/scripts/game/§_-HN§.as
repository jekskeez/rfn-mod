package game
{
   import §_-42B§.TweenMax;
   import §_-C1l§.§_-a2§;
   import §_-ZS§.§_-93d§;
   import §_-ZS§.§_-f1G§;
   import flash.display.SimpleButton;
   import flash.utils.setTimeout;
   import starling.display.Sprite;
   import starling.display.§_-jH§;
   
   public class §_-HN§ extends Sprite
   {
      
      private var §_-i25§:§_-jH§ = null;
      
      protected var §_-A38§:§_-f1G§ = null;
      
      public function §_-HN§()
      {
         super();
      }
      
      override public function set scaleX(param1:Number) : void
      {
      }
      
      override public function set scaleY(param1:Number) : void
      {
      }
      
      public function play(param1:SimpleButton, param2:int, param3:Boolean = true) : void
      {
         if(this.§_-i25§ != null)
         {
            removeChild(this.§_-i25§);
            this.§_-i25§.dispose();
            this.§_-i25§ = null;
         }
         if(param1 != null)
         {
            this.§_-i25§ = §_-a2§.§_-i2y§(param1.upState,0,1,1,null,true);
            this.§_-i25§.x = 17;
            this.§_-i25§.width = this.§_-i25§.height = 30;
            this.§_-i25§.alpha = 0.5;
            addChild(this.§_-i25§);
            TweenMax.to(this.§_-i25§,0.4,{
               "y":-this.§_-i25§.height,
               "alpha":1
            });
         }
         if(!param3)
         {
            return;
         }
         this.§_-A38§ = §_-93d§.instance.§_-23j§(§_-93d§.§_-C15§);
         this.§_-A38§.view.§_-M2F§ = this.§_-i25§.x + 15;
         this.§_-A38§.view.§_-Cg§ = this.§_-i25§.y + 65;
         this.§_-A38§.start(param2 * 0.5);
         addChild(this.§_-A38§.view);
         setTimeout(this.stop,param2 * 1000);
      }
      
      public function §_-2e§() : void
      {
         if(this.§_-i25§ == null)
         {
            return;
         }
         TweenMax.§_-R1Q§(this.§_-i25§);
         removeChild(this.§_-i25§);
         this.§_-i25§.dispose();
         this.§_-i25§ = null;
      }
      
      public function stop() : void
      {
         this.§_-2e§();
         if(this.§_-A38§ == null)
         {
            return;
         }
         this.§_-A38§.stop();
         §_-93d§.instance.§_-ms§(this.§_-A38§);
         this.§_-A38§ = null;
      }
   }
}


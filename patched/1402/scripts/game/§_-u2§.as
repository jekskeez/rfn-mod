package game
{
   import §_-22D§.TweenMax;
   import §_-A1G§.§_-11u§;
   import §_-A1G§.§_-w10§;
   import §_-hd§.§_-01M§;
   import flash.display.SimpleButton;
   import flash.utils.setTimeout;
   import starling.display.Sprite;
   import starling.display.§_-I2q§;
   
   public class §_-u2§ extends Sprite
   {
      
      private var §_-oN§:§_-I2q§ = null;
      
      protected var §_-W1u§:§_-11u§ = null;
      
      public function §_-u2§()
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
         if(this.§_-oN§ != null)
         {
            removeChild(this.§_-oN§);
            this.§_-oN§.dispose();
            this.§_-oN§ = null;
         }
         if(param1 != null)
         {
            this.§_-oN§ = §_-01M§.§_-Z1V§(param1.upState,0,1,1,null,true);
            this.§_-oN§.x = 17;
            this.§_-oN§.width = this.§_-oN§.height = 30;
            this.§_-oN§.alpha = 0.5;
            addChild(this.§_-oN§);
            TweenMax.to(this.§_-oN§,0.4,{
               "y":-this.§_-oN§.height,
               "alpha":1
            });
         }
         if(!param3)
         {
            return;
         }
         this.§_-W1u§ = §_-w10§.instance.§_-d1y§(§_-w10§.§_-s3§);
         this.§_-W1u§.view.§_-L2Z§ = this.§_-oN§.x + 15;
         this.§_-W1u§.view.§_-2F§ = this.§_-oN§.y + 65;
         this.§_-W1u§.start(param2 * 0.5);
         addChild(this.§_-W1u§.view);
         setTimeout(this.stop,param2 * 1000);
      }
      
      public function §_-R1s§() : void
      {
         if(this.§_-oN§ == null)
         {
            return;
         }
         TweenMax.§_-q29§(this.§_-oN§);
         removeChild(this.§_-oN§);
         this.§_-oN§.dispose();
         this.§_-oN§ = null;
      }
      
      public function stop() : void
      {
         this.§_-R1s§();
         if(this.§_-W1u§ == null)
         {
            return;
         }
         this.§_-W1u§.stop();
         §_-w10§.instance.§_-L1c§(this.§_-W1u§);
         this.§_-W1u§ = null;
      }
   }
}


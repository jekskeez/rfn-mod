package §_-B1O§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-RI§.§_-d2d§;
   
   public class §_-W2U§ extends §_-Z2X§
   {
      
      private var §_-n1q§:§_-d2d§ = new §_-d2d§(new ButtonScriptUp());
      
      private var §_-ih§:Boolean = false;
      
      public function §_-W2U§()
      {
         super();
         this.§_-n1q§.y = -10;
         §_-83v§(this.§_-n1q§);
         this.contactsCount = 0;
         this.size = new b2Vec2();
         this.visible = true;
         this.§_-87§ = true;
         this.§_-n1q§.loop = false;
         this.§_-n1q§.stop();
      }
      
      override public function set showDebug(param1:Boolean) : void
      {
         super.showDebug = param1;
         this.visible = true;
      }
      
      override public function set size(param1:b2Vec2) : void
      {
         if(!param1)
         {
         }
         super.size = new b2Vec2(4.4,1.6);
      }
      
      override public function get contactsCount() : int
      {
         return super.contactsCount;
      }
      
      override public function set contactsCount(param1:int) : void
      {
         super.contactsCount = param1;
         this.down = this.contactsCount > 0;
      }
      
      public function get down() : Boolean
      {
         return this.§_-ih§;
      }
      
      override protected function draw() : void
      {
      }
      
      public function set down(param1:Boolean) : void
      {
         if(this.§_-ih§ == param1)
         {
            return;
         }
         this.§_-ih§ = param1;
         if(param1)
         {
            this.§_-n1q§.§_-01w§(0,10);
         }
         else
         {
            this.§_-n1q§.§_-01w§(11,21);
         }
      }
   }
}


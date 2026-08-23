package §_-F6§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-A3j§.§_-b1N§;
   import §_-TK§.§_-aS§;
   import §_-d24§.§_-Kf§;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import flash.geom.Point;
   import game.mainGame.SquirrelGame;
   import utils.§_-O1T§;
   
   public class §_-v2T§ extends §_-b1N§ implements §_-Kf§
   {
      
      private static const §_-Ml§:int = 100;
      
      public var viscosity:Number = 1.4;
      
      protected var §_-mb§:int = 0;
      
      protected var §_-s20§:Shape = null;
      
      protected var §_-mi§:§_-aS§ = null;
      
      public function §_-v2T§()
      {
         super();
         this._alpha0 = 0.7;
         this._alpha1 = 0.7;
         this._alpha2 = 1;
         this.color0 = this.color0;
         this.color1 = this.color1;
         this.color2 = this.color2;
         resize();
      }
      
      override public function get color0() : int
      {
         return 15782276;
      }
      
      override public function get color1() : int
      {
         return 11958295;
      }
      
      override public function get color2() : int
      {
         return 8280095;
      }
      
      override public function build(param1:b2World) : void
      {
         this.controller = new §_-u4§(this);
         (this.controller as §_-u4§).viscosity = this.viscosity;
         this.controller.§_-zT§ = 5;
         param1.AddController(this.controller);
         this.graphics.clear();
         this.game = param1.userData as SquirrelGame;
         this.§_-E1P§();
      }
      
      override public function §_-m1Y§() : *
      {
         return (super.§_-m1Y§() as Array).concat([this.viscosity]);
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         if(13 in param1)
         {
            this.viscosity = param1[13];
         }
      }
      
      override public function set size(param1:b2Vec2) : void
      {
         param1.y = (param1.y > 0 ? -1 : 1) * Math.max(§_-Ml§ / Game.§_-12A§,Math.abs(param1.y));
         super.size = param1;
         this.§_-J1W§();
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.§_-E1P§();
      }
      
      public function get §_-k2d§() : Number
      {
         return this.§_-mb§;
      }
      
      override protected function §_-J1W§() : void
      {
         var _loc1_:Point = new Point(this.x,this.y);
         if(this.§_-s20§)
         {
            this.§_-E1P§();
         }
         while(numChildren > 0)
         {
            §_-av§(0);
         }
         super.§_-J1W§();
         this.§_-s20§ = new Shape();
         var _loc2_:BitmapData = §_-O1T§.getBitmapData(this.§_-93L§());
         this.§_-s20§.graphics.beginBitmapFill(_loc2_,null,true);
         this.§_-s20§.graphics.drawRect(0,0,this.§_-y1d§.x,_loc2_.height);
         this.§_-s20§.graphics.endFill();
         this.§_-s20§.x = 0;
         this.§_-s20§.y = -_loc2_.height;
         this.§_-mb§ = _loc1_.y - _loc2_.height;
         if(this.§_-mi§)
         {
            removeChildStarling(this.§_-mi§);
         }
         this.§_-mi§ = new §_-aS§(this.§_-s20§);
         this.§_-mi§.alpha = 0.4;
         §_-J2J§(this.§_-mi§);
      }
      
      protected function §_-93L§() : DisplayObject
      {
         return new QuicksandBones();
      }
      
      private function §_-E1P§() : void
      {
         if(!this.§_-s20§)
         {
            return;
         }
         if(this.§_-s20§.parent)
         {
            this.§_-s20§.parent.removeChild(this.§_-s20§);
         }
         this.§_-s20§.graphics.clear();
         this.§_-s20§ = null;
      }
   }
}


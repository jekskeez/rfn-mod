package §_-p2o§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-42p§.§_-01t§;
   import §_-RI§.§_-h2I§;
   import §_-Yb§.§_-aK§;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import flash.geom.Point;
   import game.mainGame.SquirrelGame;
   import utils.§_-93C§;
   
   public class §_-m2F§ extends §_-01t§ implements §_-aK§
   {
      
      private static const §_-Jd§:int = 100;
      
      public var viscosity:Number = 1.4;
      
      protected var §_-N1t§:int = 0;
      
      protected var §_-z2Q§:Shape = null;
      
      protected var §_-23D§:§_-h2I§ = null;
      
      public function §_-m2F§()
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
         this.controller = new §_-Y1a§(this);
         (this.controller as §_-Y1a§).viscosity = this.viscosity;
         this.controller.§_-B1Y§ = 5;
         param1.AddController(this.controller);
         this.graphics.clear();
         this.game = param1.userData as SquirrelGame;
         this.§_-FO§();
      }
      
      override public function §_-A1X§() : *
      {
         return (super.§_-A1X§() as Array).concat([this.viscosity]);
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         if(13 in param1)
         {
            this.viscosity = param1[13];
         }
      }
      
      override public function set size(param1:b2Vec2) : void
      {
         param1.y = (param1.y > 0 ? -1 : 1) * Math.max(§_-Jd§ / Game.§_-x2P§,Math.abs(param1.y));
         super.size = param1;
         this.§_-11E§();
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.§_-FO§();
      }
      
      public function get §_-D1a§() : Number
      {
         return this.§_-N1t§;
      }
      
      override protected function §_-11E§() : void
      {
         var _loc1_:Point = new Point(this.x,this.y);
         if(this.§_-z2Q§)
         {
            this.§_-FO§();
         }
         while(numChildren > 0)
         {
            §_-n2T§(0);
         }
         super.§_-11E§();
         this.§_-z2Q§ = new Shape();
         var _loc2_:BitmapData = §_-93C§.getBitmapData(this.§_-Fz§());
         this.§_-z2Q§.graphics.beginBitmapFill(_loc2_,null,true);
         this.§_-z2Q§.graphics.drawRect(0,0,this.§_-s1Y§.x,_loc2_.height);
         this.§_-z2Q§.graphics.endFill();
         this.§_-z2Q§.x = 0;
         this.§_-z2Q§.y = -_loc2_.height;
         this.§_-N1t§ = _loc1_.y - _loc2_.height;
         if(this.§_-23D§)
         {
            removeChildStarling(this.§_-23D§);
         }
         this.§_-23D§ = new §_-h2I§(this.§_-z2Q§);
         this.§_-23D§.alpha = 0.4;
         §_-83v§(this.§_-23D§);
      }
      
      protected function §_-Fz§() : DisplayObject
      {
         return new QuicksandBones();
      }
      
      private function §_-FO§() : void
      {
         if(!this.§_-z2Q§)
         {
            return;
         }
         if(this.§_-z2Q§.parent)
         {
            this.§_-z2Q§.parent.removeChild(this.§_-z2Q§);
         }
         this.§_-z2Q§.graphics.clear();
         this.§_-z2Q§ = null;
      }
   }
}

